// https://www.cvedetails.com/cve/CVE-2021-33983/
// repository: https://github.com/dvidelabs/flatcc
// commit: e926d38
// extract of: src/compiler/parser.c (function: error_ref_sym)

#include <stdio.h> // printf
#include <string.h>
#define FLATCC_MAX_IDENT_SHOW 50

int main() {
  char *strings[] = {
      "The problem",
      "is that",
      "algorithm",
      "tries to put all the strings",
      "into buf buffer because buffer",
      "space tracking with variable k",
      "does not work"};
  unsigned int stringsCount = 7;

  char buf[FLATCC_MAX_IDENT_SHOW + 1];
  size_t k = FLATCC_MAX_IDENT_SHOW; // k tracks free space in buffer 'buf'
  size_t n = 0;
  size_t n0 = 0;
  unsigned int string = 0; // tracks what string from strings we are currently processing

  while (k > 0 && string < stringsCount) {
    n = strlen(strings[string]);
    if (n > k) {
      n = k; // at some point n will be equal to k
    }
    memcpy(buf + n0, strings[string], n);
    k -= n; // if n = k, then k = k - n will result in k = 0
    n0 += n;
    buf[n0] = '.';
    --k; // Problem: because k is a size_t when it goes to negative (like -1) it wrapps and it results in buffer overflow. As a result k is esentially useless
    ++n0;
    string++;
  }
  buf[n0] = '\0';
  printf("%s", buf); // prints all strings from strings array dot separated
}
