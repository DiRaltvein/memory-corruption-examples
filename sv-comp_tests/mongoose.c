// https://www.cvedetails.com/cve/CVE-2023-2905/
// repository: https://github.com/cesanta/mongoose
// commit: 8114443
// extract of: src/mqtt.c (function: decode_variable_length)

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

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

static uint32_t decode_variable_length(const char *buf, uint32_t *bytes_consumed) {
  uint32_t value = 0, multiplier = 1, offset;

  for (offset = 0; offset < 4; offset++) {
    uint8_t encoded_byte = ((uint8_t *)buf)[offset]; // Problem: reading from a buffer (buf) which length is smaller than 4
    value += (encoded_byte & 0x7F) * multiplier;
    multiplier *= 128;

    if (!(encoded_byte & 0x80)) {
      break;
    }
  }

  if (bytes_consumed != NULL)
    *bytes_consumed = offset + 1;

  return value;
}

int main() {
  // char buf[] = {0x81, 0x81, 0x81};
  char* buf = getRandomString(1, 500);
  uint32_t bytes_consumed = 0;
  uint32_t decodedValue = decode_variable_length(buf, &bytes_consumed);
  printf("Value: %u, bytes consumed: %u\n", decodedValue, bytes_consumed);
  free(buf);
}
