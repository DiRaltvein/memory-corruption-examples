// https://www.cvedetails.com/cve/CVE-2023-49355/
// repository: https://github.com/jqlang/jq
// commit: 88f01a7
// extract of: src/decNumber/decNumber.c (function: decToString)

#include <string.h>

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

int main(int argc, char *argv[]) {
  char string[10];
  decToString(argv[0], (char *)&string);
}
