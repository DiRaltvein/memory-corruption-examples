// https://www.cvedetails.com/cve/CVE-2022-43634/
// repository: https://github.com/Netatalk/netatalk
// commit: 0637355
// extract of: libatalk/dsi/dsi_write.c (function: dsi_writeinit)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define BUF_LEN 40
#define MIN(a, b) ((a) < (b) ? (a) : (b))

typedef struct _ {
  char *start;
  char *eof;
  size_t datasize;
} DSI;

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

size_t dsi_writeinit(DSI *dsi, void *buf, const size_t buflen) {
  size_t bytes = 0;

  if (dsi->eof > dsi->start) {
    /* We have data in the buffer */
    bytes = MIN(dsi->eof - dsi->start, dsi->datasize);
    memmove(buf, dsi->start, bytes); // Problem: buf overflow if executable name is 40 or more characters
    dsi->start += bytes;
    dsi->datasize -= bytes;
    if (dsi->start >= dsi->eof)
      dsi->start = dsi->eof;
  }

  return bytes;
}

void initDsi(DSI *dsi, char *executableName) {
  dsi->start = executableName;
  dsi->datasize = strlen(executableName);
  dsi->eof = dsi->start + dsi->datasize;
}

int main() {
  char* executableName = getRandomString(5, 50);

  DSI dsi = {0};
  initDsi(&dsi, executableName);
  char buf[BUF_LEN];
  while (dsi.eof > dsi.start) {
    dsi_writeinit(&dsi, &buf, BUF_LEN);
  }
  free(executableName);
}
