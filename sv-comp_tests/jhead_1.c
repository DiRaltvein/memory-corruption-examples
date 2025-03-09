// https://www.cvedetails.com/cve/CVE-2020-28840/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: e64e904
// extract of: jpgfile.c (function: process_COM)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char uchar;
#define MAX_COMMENT_SIZE 16000

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

static void process_COM(uchar *Data, int length) {
  int ch;
  char Comment[MAX_COMMENT_SIZE + 1];
  int nch;
  int a;

  nch = 0;

  if (length > MAX_COMMENT_SIZE)
    length = MAX_COMMENT_SIZE; // Truncate if it won't fit in our structure.

  for (a = 2; a < length; a++) {
    ch = Data[a];

    if (ch == '\r' && Data[a + 1] == '\n') // Problem: Data[a + 1] results in read out of bound by 1 byte in case \r is the last character in a string
      continue;                            // Remove cr followed by lf.

    if (ch >= 32 || ch == '\n' || ch == '\t') {
      Comment[nch++] = (char)ch;
    } else {
      Comment[nch++] = '?';
    }
  }

  Comment[nch] = '\0'; // Null terminate

  printf("COM marker comment: %s\n", Comment);
}

int main() {
  char* data = getRandomStringNotZeroTerminated(MAX_COMMENT_SIZE);
  size_t dataSize = MAX_COMMENT_SIZE;
  process_COM(data, dataSize);
  free(data);
}
