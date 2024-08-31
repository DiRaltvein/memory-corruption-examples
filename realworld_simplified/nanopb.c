// https://www.cvedetails.com/cve/CVE-2014-125106/
// repository: https://github.com/nanopb/nanopb
// commit: d0466bd
// extract of: pb_decode.c (function: pb_dec_string)

#include <limits.h>
#include <stdio.h>

void setSize(int *size) {
  *size = INT_MAX;
}

int main() {
  int size;
  setSize(&size);
  printf("%i\n", size + 1); // Problem: adding 1 to INT_MAX results in a integer overflow
}
