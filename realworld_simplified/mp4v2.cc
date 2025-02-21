// https://www.cvedetails.com/cve/CVE-2023-29584/
// repository: https://github.com/enzo1982/mp4v2
// commit: cfc394d
// extract of: src/mp4.cpp (function: MP4GetVideoProfileLevel)

#include <stdio.h>
#include <stdint.h>

#define MP4V2_BYTESWAP_32(x)                       \
  (uint32_t)(((uint32_t(x) & 0xFF000000U) >> 24) | \
             ((uint32_t(x) & 0x00FF0000U) >> 8) |  \
             ((uint32_t(x) & 0x0000FF00U) << 8) |  \
             ((uint32_t(x) & 0x000000FFU) << 24))

uint8_t MP4GetVideoProfileLevel(uint8_t *buffer, size_t bufsize) {
  uint8_t *ptr = buffer;
  while (bufsize > 0) {
    if (MP4V2_BYTESWAP_32(*(uint32_t *)ptr) == 0x1b0) { // Problem: buffer size is checked to be more then 0 but 4 bytes are accessed of the buffer
      return ptr[4];
    }
    ptr++;
    bufsize--;
  }
  return 0;
}

int main() {
  uint8_t buffer[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00
  };
  size_t bufsize = sizeof(buffer) / sizeof(buffer[0]);
  uint8_t value = MP4GetVideoProfileLevel((uint8_t* )&buffer, bufsize);
  if (value == 0) {
    printf("No interesting value found\n");
  } else {
    printf("Interesting value found %u\n", value);
  }
}
