// https://www.cvedetails.com/cve/CVE-2022-28550/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: 06e8d7a
// extract of: jhead.c (function: DoCommand)

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
  char* executableName = getRandomString(1, 20);
  char* str = getRandomString(5, 500);

  int j = 0;
  char ExecString[600];

  for (int i = 0; i < strlen(str); i++) {
    if (str[i] == 'a') {
      int i = 0;
      while (executableName[i]) {
        ExecString[j++] = executableName[i++]; // Problem: as we are substituting every a passed as an argument with an executable file name ExecString can overflow
      }
      ExecString[j++] = ' ';
    }
  }

  free(executableName);
  free(str);

  printf("%s\n", ExecString);
}
