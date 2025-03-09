// https://www.cvedetails.com/cve/CVE-2021-33797/
// repository: https://github.com/ccxvii/mujs
// commit: 292415b
// extract of: jsdtoa.c (function: js_strtod)

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

int main() {
  char *string = getRandomString(50, 500);
  int exp = 0;

  // convert string into number
  while ((*string >= '0') && (*string <= '9')) {
    exp = exp * 10 + (*string - '0'); // Problem: number from command line can be greater then an 4 byte int can hold. If big enough number is given signed integer overflow can happen
    string += 1;
  }

  printf("%d\n", exp);
}
