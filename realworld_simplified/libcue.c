// https://www.cvedetails.com/cve/CVE-2023-43641/
// repository: https://github.com/lipnitsk/libcue
// commit: 78279d0
// extract of: cd.c (function: track_set_index)

#include <stdio.h>
#include <stdlib.h>

#define MAXINDEX 99

int getAnInt(int argc, char *argv[]) {
  if (argc == 1)
    return 0;
  return atoi(argv[1]);
}

int main(int argc, char *argv[]) {
  int index[MAXINDEX + 1] = {0};
  int randomInt = getAnInt(argc, argv);

  if (randomInt > MAXINDEX) {
    fprintf(stderr, "too many indexes\n");
    return -1;
  }

  index[randomInt] = 5; // Problem: randomInt may be negative
}
