#include <stdlib.h> // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#include <string.h> // for memcpy

#include <stdlib.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize - 1) {
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
  return randomString;
}

/**
 * Just a utility function in test creation that extends given string with random characters
 */
char *extendString(char* string, int stringLength, int charactersToAdd) {
  size_t newLen = stringLength + charactersToAdd - 1;
  char* extendedString = (char*)calloc(stringLength + charactersToAdd + 1, sizeof(char));
  if (extendedString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  // copy initial string;
  memcpy(extendedString, string, stringLength);
  for (int i = stringLength; i < newLen; i++) {
    extendedString[i] = __VERIFIER_nondet_char();
  }
  extendedString[newLen - 1] = '\0';
  return extendedString;
}

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int size) {
  char *randomString = (char*)calloc(size + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  return randomString;
}

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
