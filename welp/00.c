#include <string.h>
#include <stdlib.h>
#include <stdio.h>

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

// ------------------------------------------------------------------------------------------------------------------------------------- \\


#include <stdio.h>
#include <stdlib.h>

extern unsigned char __VERIFIER_nondet_uchar();
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

// ------------------------------------------------------------------------------------------------------------------------------------- \\


extern char __VERIFIER_nondet_char(void);

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


// ------------------------------------------------------------------------------------------------------------------------------------- \\


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


// ------------------------------------------------------------------------------------------------------------------------------------- \\


#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);

/**
 * Just a utility function in test creation that extends given string with random characters
 */
char *extendString(char* string, int stringLength, int charactersToAdd) {
  size_t newLen = stringLength + charactersToAdd;
  char* extendedString = (char*)calloc(newLen + 1, sizeof(char));
  if (extendedString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  // copy initial string;
  memcpy(extendedString, string, stringLength);
  for (int i = stringLength; i < newLen; i++) {
    extendedString[i] = __VERIFIER_nondet_char();
  }
  extendedString[newLen] = '\0';
  return extendedString;
}


// ------------------------------------------------------------------------------------------------------------------------------------- \\


#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);

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


// ------------------------------------------------------------------------------------------------------------------------------------- \\


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
