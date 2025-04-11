// https://www.cvedetails.com/cve/CVE-2022-28550/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: 06e8d7a
// extract of: jhead.c (function: DoCommand)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

int main() {
  char* executableName = getRandomString(1, 20);
  char* str = getRandomString(5, 300);

  int j = 0;
  char ExecString[600];

  for (int i = 0; i < strlen(str); i++) {
    if (str[i] == 'a') {
      int i = 0;
      while (executableName[i]) {
        ExecString[j++] = executableName[i++]; // Problem: as we are substituting every a passed as an argument with an executable file name ExecString can overflow
      }
      ExecString[j++] = ' ';
    }
  }

  free(executableName);
  free(str);

  printf("%s\n", ExecString);
}
