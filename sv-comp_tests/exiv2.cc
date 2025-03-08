// https://www.cvedetails.com/cve/CVE-2020-18831/
// repository: https://github.com/Exiv2/exiv2
// commit: 109d5df
// extract of: src/pngimage.cpp (function: printStructure)

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <sys/stat.h>

typedef uint8_t byte;

const uint8_t pngSignature[8] = {137, 80, 78, 71, 13, 10, 26, 10};

bool isPngType(FILE *file, bool advance) {
  if (!file) {
    throw std::runtime_error("Failed to access file");
  }

  const int32_t len = 8;
  uint8_t buf[len];
  size_t bytesRead = fread(buf, 1, len, file);
  if (bytesRead < len) {
    return false;
  }

  bool isPng = (memcmp(buf, pngSignature, len) == 0);

  if (!advance || !isPng) {
    fseek(file, -len, SEEK_CUR);
  }

  return isPng;
}

bool eof(FILE *file, long fileSize) {
  return feof(file) || ftell(file) >= fileSize;
}

// function looks for hex data that is saved in tEXt section
void tEXtToDataBuf(byte *bytes, uint32_t length) { // function may receive incorrect length
  static const char *hexdigits = "0123456789ABCDEF";
  static int value[256];
  static bool bFirst = true;
  if (bFirst) {
    for (int i = 0; i < 256; i++)
      value[i] = 0;
    for (int i = 0; i < 16; i++) {
      value[tolower(hexdigits[i])] = i + 1;
      value[toupper(hexdigits[i])] = i + 1;
    }
    bFirst = false;
  }

  // calculate length and allocate result;
  // count: number of \n in the header
  long count = 0;
  // p points to the current position in the array bytes
  const byte *p = bytes;

  // header is '\nsomething\n number\n hex'
  // => increment p until it points to the byte after the last \n
  //    p must stay within bounds of the bytes array!
  while ((count < 3) && (p - bytes < length)) {
    // length is later used for range checks of p => decrement it for each increment of p
    --length;
    if (*p++ == '\n') { // Problem: with incorrect length this access will be invalid
      count++;
    }
  }
  for (long i = 0; i < length; i++)
    if (value[p[i]])
      ++count;
  byte *result = (byte*)calloc((count + 1) / 2, sizeof(byte));

  // hex to binary
  count = 0;
  byte *r = result;
  int n = 0; // nibble
  for (long i = 0; i < length; i++) {
    if (value[p[i]]) {
      int v = value[p[i]] - 1;
      if (++count % 2)
        n = v * 16; // leading digit
      else
        *r++ = n + v; // trailing
    }
  }

  std::cout << "Extracted Binary Data: ";
  for (long i = 0; i < (count + 1) / 2; i++) {
      std::cout << "0x" << std::hex << (int)result[i] << ", ";
  }
  std::cout << std::endl;
  free(result);
}

void printStructure(const char *filepath) {
  FILE *file = fopen(filepath, "rb");
  if (!file) {
    throw std::runtime_error("Failed to open file");
  }
  if (!isPngType(file, true)) {
    throw std::runtime_error("Provided file is not a png image");
  }

  char chType[5] = {0};

  struct stat stat_buf;
  int rc = stat(filepath, &stat_buf);
  if (rc != 0) {
    throw std::runtime_error("Could not determine size of file");
  }
  long imgSize = stat_buf.st_size;

  uint8_t cheaderBuf[8];
  while (!eof(file, imgSize) && ::strcmp(chType, "IEND")) {
    long address = ftell(file);

    long bufRead = fread(cheaderBuf, 1, 8, file);
    if (bufRead != 8) {
      throw std::runtime_error("EOF");
    }
    uint32_t dataOffset = (cheaderBuf[0] << 24) | (cheaderBuf[1] << 16) | (cheaderBuf[2] << 8) | cheaderBuf[3];
    for (int i = 4; i < 8; i++) {
      chType[i - 4] = cheaderBuf[i];
    }

    if (std::strcmp(chType, "IEND") == 0) {
      break;
    }

    // Only output tEXt chunks and skipp all other
    if (std::strcmp(chType, "tEXt") != 0) {
      fseek(file, dataOffset + 4, SEEK_CUR); // skip main body + checksum 4 bytes

      std::cout << "Skipping tag: " << chType << std::endl;
      continue;
    }

    long restore = ftell(file);
    if (dataOffset > static_cast<uint32_t>(imgSize - restore) || dataOffset > uint32_t(0x7FFFFFFF)) {
      throw std::runtime_error("Invalid chunk size");
    }

    char *buffer = (char *)calloc(dataOffset + 1, sizeof(char));
    buffer[dataOffset] = 0;
    fread(buffer, 1, dataOffset, file); // copy all data from tEXt section into buffer
    uint32_t  name_l = (uint32_t) std::strlen((const char*)buffer)+1; // leading string length

    tEXtToDataBuf((byte*)buffer + name_l, dataOffset - name_l); // Problem: name_l may potentially be greater than dataOffset that would result in unsigned integer underflow

    fseek(file, 4, SEEK_CUR); // skip checksum

    std::cout << "Address: " << std::hex << address << std::endl;
    std::cout << "Chunk: " << chType << std::endl;
    std::cout << "Length: " << dataOffset << std::endl;
    std::cout << "Data: " << buffer << " : " << buffer + name_l << std::endl;

    free(buffer);
  }
  fclose(file);
}

// tEXt png section structure: <4 byte length><4 byte type (like tEXt/IEND/IDAT)><title\0value><4 byte checksum>
int main() {
  printStructure("exiv2.cc");
}
