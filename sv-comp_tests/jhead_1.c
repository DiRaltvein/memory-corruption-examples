// https://www.cvedetails.com/cve/CVE-2020-28840/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: e64e904
// extract of: jpgfile.c (function: process_COM)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char uchar;
#define MAX_COMMENT_SIZE 16000
#define EXAMPLE_LENGTH 17

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
  uchar *data = calloc(EXAMPLE_LENGTH, sizeof(uchar));
  if (data == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  // memcpy such that data buffer is not null terminated. Is needed for memory sanitizers to detect 1 read out of bound.
  // Otherwise, if string is null terminated zero byte is read and no error is outputted
  memcpy(data, "Some random data\r", EXAMPLE_LENGTH);
  process_COM(data, EXAMPLE_LENGTH);
  free(data);
}
