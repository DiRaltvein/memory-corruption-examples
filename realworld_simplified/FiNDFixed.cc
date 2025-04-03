// https://www.cvedetails.com/cve/CVE-2015-10065/
// repository: https://github.com/AenBleidd/FiND
// commit: 3cc9b68
// extract of: validator/my_validator.cpp (function: init_result)

#include <stdio.h>
#include <string.h>

int main() {
  FILE *f = fopen("text.txt", "r");
  if (f == NULL) {
    printf("Could not open file\n");
    return 1;
  }
  char buff[256];
  fgets(buff, 256, f);

  char* pch;
	pch = strtok(buff, " ,");
  while (pch != NULL) {
    printf("Read split of string: %s\n", pch);
    pch = strtok(NULL, " ,");
  }

  fclose(f);
}
