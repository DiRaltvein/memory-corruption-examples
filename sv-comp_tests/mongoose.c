// https://www.cvedetails.com/cve/CVE-2023-2905/
// repository: https://github.com/cesanta/mongoose
// commit: 8114443
// extract of: src/mqtt.c (function: decode_variable_length)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

/**
 * Just a utility function in test creation that generates random string of specified size that is not zero terminated
 */
char *getRandomStringNotZeroTerminated(int size) {
  char *randomString = (char*)calloc(size, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  return randomString;
}

static int decode_variable_length(const char *buf, int *bytes_consumed) {
  int value = 0, multiplier = 1, offset;

  for (offset = 0; offset < 4; offset++) {
    char encoded_byte = buf[offset]; // Problem: reading from a buffer (buf) which length is smaller than 4
    value += encoded_byte * multiplier;
    multiplier *= 128;

    if (!(encoded_byte & 0x10)) {
      break;
    }
  }

  if (bytes_consumed != NULL)
    *bytes_consumed = offset + 1;

  return value;
}

int main() {
  // char buf[] = {0x1A, 0x1B, 0x1C};
  int size = getNumberInRange(1, 500);
  char* buf = getRandomStringNotZeroTerminated(size);
  int bytes_consumed = 0;
  int decodedValue = decode_variable_length(buf, &bytes_consumed);
  printf("Value: %d, bytes consumed: %d\n", decodedValue, bytes_consumed);
  free(buf);
}
