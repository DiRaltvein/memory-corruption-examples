// https://www.cvedetails.com/cve/CVE-2022-46449/
// repository: https://github.com/MusicPlayerDaemon/MPD
// commit: c2d0f35
// extract of: src/system/Error.hxx (function: FormatLastError)

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
  char* randomString = getRandomString(5, 500);

  char buffer[500];
  // the problem is  that snprintf returns 'the number of characters that would have been written if n had been sufficiently large'
  // as per https://cplusplus.com/reference/cstdio/snprintf/
  // So if string to write into buffer is longer than 30 (50 - 20) bytes then nothing is written into buffer and the length of the string is returned
	size_t length = snprintf(buffer, sizeof(buffer) - 20, "Your privided string: %s", randomString);
	char *p = buffer + length;
	*p++ = ':'; // Problem: write out of bound by one byte
	*p++ = ' '; // Problem: write out of bound by one byte

  printf("%s\n", buffer);
  free(randomString);
}
