// https://www.cvedetails.com/cve/CVE-2023-49355/
// repository: https://github.com/jqlang/jq
// commit: 88f01a7
// extract of: src/decNumber/decNumber.c (function: decToString)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

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
