// https://www.cvedetails.com/cve/CVE-2022-28550/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: 06e8d7a
// extract of: jhead.c (function: DoCommand)

#include <stdio.h>

#define PATH_MAX 10

// idea is that when running this file then every 'a' that is passed as an argument to the progam gets replaced with the name of the program
// following execution leads to stach smash:
// - ./a.out a a a a a a

int main(int argc, char *argv[]) {
  int j = 0;
  char ExecString[PATH_MAX * 3];

  for (int i = 0; i < argc; i++) {
    if (*argv[i] == 'a') {
      int i = 0;
      while (argv[0][i]) {
        ExecString[j++] = argv[0][i++]; // Problem: as we are substituting every a passed as an argument with an executable file name ExecString can overflow
      }
      ExecString[j++] = ' ';
    }
  }

  printf("%s\n", ExecString);
}
