// https://www.cvedetails.comq/cve/CVE-2014-125106/
// repository: https://github.com/nanopb/nanopb
// commit: d0466bd
// extract of: pb_decode.c (function: pb_dec_string)

#include <limits.h>
#include <stdio.h>

void setSize(int *size) {
  *size = INT_MAX;
}

int main(int argc, char *argv[]) {
  int size;
  setSize(&size);
  printf("%i\n", size + 1); // Problem: adding 1 to INT_MAX results in a integer overflow
}
