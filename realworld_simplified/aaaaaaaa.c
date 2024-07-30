// <cvedetails url>
// repository: <repository url>
// commit: <commit hash where vulnerability exists>
// extract of: <path from project root to file with vulnerability> (function: <function name with vulnerability>)

#include <stdio.h>  // printf
#include <stdlib.h> // atoi

int getAnInt(int argc, char *argv[]) {
  if (argc == 1)
    return 0;
  return atoi(argv[1]);
}

int main(int argc, char *argv[]) {
  // Repro
  printf("%i, %s, %c, %.2f\n", 5, "string", 'R', 5.235);
}
