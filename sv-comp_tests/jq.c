// https://www.cvedetails.com/cve/CVE-2023-49355/
// repository: https://github.com/jqlang/jq
// commit: 88f01a7
// extract of: src/decNumber/decNumber.c (function: decToString)

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
  char* randomString = getRandomString(50, 500);
  char* converted = calloc(strlen(randomString) + 1, sizeof(char));
  if (converted == NULL) {
    printf("Out of memory\n");
    free(randomString);
    exit(1);
  }
  decToString(randomString, converted);
  printf("%s\n", converted);
  free(converted);
  free(randomString);
}
