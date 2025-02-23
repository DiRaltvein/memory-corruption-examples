#include <stdlib.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int size) {
  char *userInput = calloc(size + 1, sizeof(char));
  for (int i = 0; i < size; i++) {
    userInput[i] = __VERIFIER_nondet_char();
  }
  return userInput;
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
