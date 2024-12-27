// https://www.cvedetails.com/cve/CVE-2023-1190/
// repository: https://github.com/xiaozhuai/imageinfo
// commit: ea3eb17
// extract of: imageinfo.hpp (function: IIProcessFunc)

#include <cassert>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <regex>
#include <set>
#include <string>
#include <tuple>
#include <unordered_map>
#include <unordered_set>

typedef std::function<void(void *buf, off_t offset, size_t size)> IIReadFunc;

class IIBuffer {
public:
  IIBuffer() = default;

  explicit IIBuffer(size_t size) {
    alloc(size);
  }

  inline void alloc(size_t size) {
    m_size = size;
    m_data = std::shared_ptr<uint8_t>(new uint8_t[size], std::default_delete<uint8_t[]>());
  }

  inline const uint8_t *data() const {
    return m_data.get();
  }

  inline uint8_t *data() {
    return m_data.get();
  }

  inline size_t size() const {
    return m_size;
  }

  inline uint8_t &operator[](int offset) {
    return m_data.get()[offset];
  }

  inline uint8_t operator[](int offset) const {
    return m_data.get()[offset];
  }

public:
  inline uint32_t readU32BE(off_t offset) {
    return readInt<uint32_t>(offset, true);
  }

  template <typename T>
  inline T readInt(off_t offset, bool swapEndian = false) {
    T val = *((T *)(data() + offset)); // overflow is here
    return swapEndian ? swapE<T>(val) : val;
  }

  inline std::string readString(off_t offset, size_t size) {
    return std::string((char *)data() + offset, size);
  }

  inline std::string toString() {
    return std::string((char *)data(), size());
  }

  inline bool cmp(off_t offset, size_t size, const void *buf) {
    return memcmp(data() + offset, buf, size) == 0;
  }

  inline bool cmpAnyOf(off_t offset, size_t size, const std::initializer_list<const void *> &bufList) {
    return std::any_of(bufList.begin(), bufList.end(), [this, offset, size](const void *buf) {
      return memcmp(data() + offset, buf, size) == 0;
    });
  }

private:
  template <typename T>
  static T swapE(T u) {
    union {
      T u;
      uint8_t u8[sizeof(T)];
    } source{}, dest{};
    source.u = u;
    for (size_t k = 0; k < sizeof(T); k++)
      dest.u8[k] = source.u8[sizeof(T) - k - 1];
    return dest.u;
  }

private:
  std::shared_ptr<uint8_t> m_data = nullptr;
  size_t m_size = 0;
};

class IIFilePathReader {
public:
  explicit IIFilePathReader(const std::string &path) : m_file(path, std::ios::in | std::ios::binary) {}

  ~IIFilePathReader() {
    if (m_file.is_open()) {
      m_file.close();
    }
  }

  inline size_t size() {
    if (m_file.is_open()) {
      m_file.seekg(0, std::ios::end);
      return (size_t)m_file.tellg();
    } else {
      return 0;
    }
  }

  inline void read(void *buf, off_t offset, size_t size) {
    m_file.seekg(offset, std::ios::beg);
    m_file.read((char *)buf, (std::streamsize)size);
  }

private:
  std::ifstream m_file;
};

class IIReadInterface {
public:
  IIReadInterface() = delete;

  IIReadInterface(IIReadFunc &readFunc, size_t length)
      : m_readFunc(readFunc),
        m_length(length) {}

  inline IIBuffer readBuffer(off_t offset, size_t size) {
    assert(offset >= 0);
    assert(offset + size <= m_length);
    IIBuffer buffer(size);
    read(buffer.data(), offset, size);
    return buffer;
  }

  inline size_t length() const {
    return m_length;
  }

private:
  inline void read(void *buf, off_t offset, size_t size) {
    m_readFunc(buf, offset, size);
  }

private:
  IIReadFunc &m_readFunc;
  size_t m_length = 0;
};

bool avifDetector(size_t length, IIReadInterface &ri) {
  if (length < 4) {
    return false;
  }

  auto buffer = ri.readBuffer(0, 4);
  uint32_t ftypBoxLength = buffer.readU32BE(0);
  if (length < ftypBoxLength + 12 || ftypBoxLength < 16) { // added check for ftypBoxLength < 16 to avoid another buffer overflow vulnerability when iterating over compatibleBrandSize
    return false;
  }

  buffer = ri.readBuffer(0, ftypBoxLength + 12);
  if (!buffer.cmp(4, 4, "ftyp")) {
    return false;
  }

  /**
   * Major Brand
   *
   * AVIF: "avif"
   * HEIF: "mif1", "msf1"
   * HEIC: "heic", "heix", "hevc", "hevx"
   *
   */
  if (!buffer.cmpAnyOf(8, 4, {"avif", "mif1", "msf1", "heic", "heix", "hevc", "hevx"})) {
    return false;
  }

  uint32_t compatibleBrandSize = (ftypBoxLength - 16) / 4;
  std::unordered_set<std::string> compatibleBrands;
  for (uint32_t i = 0; i < compatibleBrandSize; ++i) {
    compatibleBrands.insert(buffer.readString(16 + i * 4, 4));
  }

  // same as heic, compatibleBrands contains "avif"
  if (compatibleBrands.find("avif") == compatibleBrands.end()) {
    return false;
  }

  if (!buffer.cmp(ftypBoxLength + 4, 4, "meta")) {
    return false;
  }

  uint32_t metaLength = buffer.readU32BE(ftypBoxLength);

  if (length < ftypBoxLength + 12 + metaLength) {
    return false;
  }

  buffer = ri.readBuffer(ftypBoxLength + 12, metaLength);

  off_t offset = 0;
  off_t end = metaLength;

  /**
   * find ispe box
   *
   * meta
   *   - ...
   *   - iprp
   *       - ...
   *       - ipco
   *           - ...
   *           - ispe
   */
  while (offset < end) {
    uint32_t boxSize = buffer.readU32BE(offset); // Problem: if offset is greater than file length (length variable) this call will result in a buffer overflow
    if (buffer.cmpAnyOf(offset + 4, 4, {"iprp", "ipco"})) {
      // end is assumed to be the end of boxSize but if boxSize length is malformed then end can be greater than file overal length
      // if boxSize if large than it can cause read out of bounds of a buffer
      end = offset + boxSize;
      offset += 8;
    } else if (buffer.cmp(offset + 4, 4, "ispe")) {
      return true;
    } else {
      offset += boxSize;
    }
  }

  return false;
}

int main() {
  IIFilePathReader fileReader("imageinfo.hex");
  size_t length = fileReader.size();
  IIReadFunc read = [&](void *buf, off_t offset, size_t size) { fileReader.read(buf, offset, size); };
  IIReadInterface ri(read, length);

  if (avifDetector(ri.length(), ri)) {
    printf("AVIF\n");
  } else {
    printf("Not AVIF\n");
  }
}
