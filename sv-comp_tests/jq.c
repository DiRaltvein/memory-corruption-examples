// https://www.cvedetails.com/cve/CVE-2023-49355/
// repository: https://github.com/jqlang/jq
// commit: 88f01a7
// extract of: src/decNumber/decNumber.c (function: decToString)

// For now without a licence but because each one of test cases originates from an open source software I will probably have to add a separate licence for each test case
// This is yet to be decided, for not without a licence, but licence can be found from jq project, link in above

#include <stdio.h>
#include <string.h>

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

void decToString(char *input, char *string) {
  char *c = string;
  char *b = input;
  while (*b) {
    if (*b == 'a') {
      strcpy(c, "A found"); // Problem: potential stack buffer overflow
      c += 7;
    } else {
      *c = '-'; // Problem: potential stack buffer overflow
      c++;
    }
    b++;
  }
}

int main() {
  int size = getNumberInRange(5, 1000);
  char *userInput = getRandomString(size);
  char *stringToPutDecodedValueTo = calloc(size + 1, sizeof(char));

  decToString(userInput, stringToPutDecodedValueTo);

  printf("%s\n", stringToPutDecodedValueTo);

  free(userInput);
  free(stringToPutDecodedValueTo);
}
