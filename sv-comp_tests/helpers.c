#include <string.h>
#include <stdlib.h>
#include <stdio.h>

// #include "helpers.c"

extern long __VERIFIER_nondet_long();
extern unsigned long __VERIFIER_nondet_ulong();

extern char __VERIFIER_nondet_char();
extern unsigned char __VERIFIER_nondet_uchar();

extern short __VERIFIER_nondet_short();
extern unsigned short __VERIFIER_nondet_ushort();

extern float __VERIFIER_nondet_float();
extern double __VERIFIER_nondet_double();

extern int __VERIFIER_nondet_int(void);
extern unsigned int __VERIFIER_nondet_uint(void);

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
 * Just a utility function in test creation that generates random sequence of unsigned characters (sequence is not zero terminated)
 */
unsigned char *getRandomByteStream(int size) {
  unsigned char *randomString = (unsigned char*)calloc(size, sizeof(unsigned char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_uchar();
  }
  return randomString;
}

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = getNumberInRange(lowestSize, highestSize);

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

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomStringFixedSize(int size) {
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