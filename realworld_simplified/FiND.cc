// https://www.cvedetails.com/cve/CVE-2015-10065/
// repository: https://github.com/AenBleidd/FiND
// commit: 3cc9b68
// extract of: validator/my_validator.cpp (function: init_result)

#include <stdio.h>

int main() {
  FILE *f = fopen("text.txt", "r");
  if (f == NULL) {
    return 1;
  }
  char buff[256];
  fscanf(f, "%s", buff); // Problem: if file text.txt holds a word that is longer then 256 characters buffer will overflow
  fclose(f);
}
