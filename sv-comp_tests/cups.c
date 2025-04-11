// https://www.cvedetails.com/cve/CVE-2023-4504/
// repository: https://github.com/OpenPrinting/cups
// commit: 9d57699
// extract of: cups/raster-interpret.c (function: scan_ps)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

int main() {
  char *cur = getRandomString(5, 500);
  char* curcpy = cur;
  size_t curSize = strlen(cur);
  char *decoded = calloc(curSize, sizeof(char));
  if (decoded == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  char *decodedp = decoded;

  for (cur++; *cur; cur++) {
    if (*cur == '\\') {
      cur++; // Problem: after addition if cur pointer was already pointing to the last character in a string it will point to the null byte
      // it leads to reading outside of the string because in the end of for cycle cur pointer is once again incremented by the for loop
      if (*cur == 'b') {
        *decodedp++ = '\b';
      } else if (*cur == 'f') {
        *decodedp++ = '\f';
      } else if (*cur == 'n') {
        *decodedp++ = '\n';
      } else if (*cur == 'r') {
        *decodedp++ = '\r';
      } else if (*cur == 't') {
        *decodedp++ = '\t';
      } else {
        printf("Could not decode escaped character\n");
      }
      continue;
    }
    *decodedp++ = *cur;
  }
  printf("Decoded value: %s\n", decoded);
  free(curcpy);
  free(decoded);
}
