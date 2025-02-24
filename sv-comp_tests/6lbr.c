// https://www.cvedetails.com/cve/CVE-2021-46901/
// repository: https://github.com/cetic/6lbr
// commit: c3092a1
// extract of: examples/6lbr/apps/6lbr-webserver/httpd.c (function: httpd_is_file)

#include <string.h>
#include <unistd.h>

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

int main() {
  int size = getNumberInRange(5, 100);
  char *userInput = getRandomString(size);

  char filepath[100];
  strcpy(filepath, "/static/");
  strcat(filepath, userInput); // Problem: in case parameter is long enough buffer overflow will occur
  printf("%s\n", filepath);
  free(userInput);
}
