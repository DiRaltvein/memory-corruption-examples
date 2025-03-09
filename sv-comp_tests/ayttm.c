// https://www.cvedetails.com/cve/CVE-2015-10088/
// repository: https://github.com/ayttm/ayttm
// commit: da8940c
// extract of: libproxy/proxy.c (function: http_connect)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define debug_print printf

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
  char cmd[512];
  char debug_buff[512];

  char* randomString = getRandomString(5, 400);

  snprintf(cmd, sizeof(cmd), "CONNECT %s:%d HTTP/1.1", randomString, strlen(randomString));
  snprintf(debug_buff, sizeof(debug_buff), "<%s>\n", cmd);
  debug_print(debug_buff); // Problem: printf without providing a format

  free(randomString);
}
