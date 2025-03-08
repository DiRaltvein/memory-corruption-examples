// https://www.cvedetails.com/cve/CVE-2023-49355/
// repository: https://github.com/jqlang/jq
// commit: 88f01a7
// extract of: src/decNumber/decNumber.c (function: decToString)

#include <stdio.h>
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

// to cause an overflow pass as an argument a string that consists of more than 50 characters or has a lot of characters 'a' in it
int main(int argc, char *argv[]) {
  if (argc < 2) {
    return 1;
  }
  char string[50] = {0};
  decToString(argv[1], (char *)&string);
  printf("%s\n", string);
}
