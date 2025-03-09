// https://www.cvedetails.com/cve/CVE-2023-43361/
// repository: https://github.com/xiph/vorbis-tools
// commit: 7168723
// extract of: oggenc/platform.c (function: create_directorie)

#include <cstring>
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
  // char fn[] = "/home/test/";
  char* fn = getRandomString(5, 500);

  char *end, *start;

  start = fn;

  while ((end = strpbrk(start + 1, "/")) != NULL) { // Problem: start + 1 results in an access out of bound even after null byte
    start = end + 1;
  }
  free(fn);
}
