// https://www.cvedetails.com/cve/CVE-2023-2617/
// repository: https://github.com/opencv/opencv_contrib
// commit: 960b3f6
// extract of: modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp (function: decodeByteSegment)

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <string.h>

typedef char byte;
typedef std::string string;
typedef struct {
  byte* bytes_;
  size_t size_;
  size_t byteOffset_;

  byte readByte() {
    if (byteOffset_ >= size_) return 0;
    return bytes_[byteOffset_++];
  };
  size_t availableBits() { return 8 * (size_ - byteOffset_); };
} ByteSource;

// in case count is non zero but availible is 0 then count will be updated to 0 but nBytes will remain non zero
void decodeByteSegment(ByteSource* bytes, string* result, size_t count) {
  size_t nBytes = count;
  size_t available = bytes->availableBits();
  if (count * 8 > available) {
    count = (available + 7) / 8;
  }

  byte* readBytes = (byte*)calloc(count, sizeof(byte));
  if (readBytes == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (size_t i = 0; i < count; i++) {
    readBytes[i] = (char)bytes->readByte();
  }

  result->append((const char*)readBytes, nBytes); // Problem: overflow of readBytes because nBytes may be greater than readBytes
  free(readBytes);
}

int main() {
  byte data[] = "\x12\x00Some random string\x1d\x00 and some other random string\x05\x00";
  ByteSource bytes = {
    .bytes_ = (byte*) data,
    .size_ = sizeof(data) / sizeof(data[0]),
    .byteOffset_ = 0
  };

  while (bytes.availableBits() >= sizeof(unsigned short)) {
    unsigned short length = 0;
    memcpy(&length, bytes.bytes_ + bytes.byteOffset_, sizeof(unsigned short));
    bytes.byteOffset_ += sizeof(unsigned short);
    string str;
    decodeByteSegment(&bytes, &str, length);
    printf("decoded string with length of %d: %s\n", length, str.c_str());
  }
}
