// https://www.cvedetails.com/cve/CVE-2023-29584/
// repository: https://github.com/enzo1982/mp4v2
// commit: cfc394d
// extract of: src/mp4.cpp (function: MP4GetVideoProfileLevel)

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define MP4V2_BYTESWAP_32(x)                       \
  (uint32_t)(((uint32_t(x) & 0xFF000000U) >> 24) | \
             ((uint32_t(x) & 0x00FF0000U) >> 8) |  \
             ((uint32_t(x) & 0x0000FF00U) << 8) |  \
             ((uint32_t(x) & 0x000000FFU) << 24))

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }

  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}

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
  // uint8_t buffer[] = {
  //   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
  // };
  // size_t bufsize = sizeof(buffer) / sizeof(buffer[0]);

  char* buffer = getRandomString(5, 500);

  uint8_t value = MP4GetVideoProfileLevel((uint8_t*)buffer, strlen(buffer));
  if (value == 0) {
    printf("No interesting value found\n");
  } else {
    printf("Interesting value found %u\n", value);
  }
  free(buffer);
}
