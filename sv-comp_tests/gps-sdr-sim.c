// https://www.cvedetails.com/cve/CVE-2021-37778/
// repository: https://github.com/osqzss/gps-sdr-sim
// commit: d361b2c
// extract of: gpssim.c (function: main)

#include <getopt.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

#define MAX_CHAR (100)

int main() {
  int result;
  char navfile[MAX_CHAR];

  char **argv = calloc(3, sizeof(char *));
  if (argv == null) {
    printf("Out of memory\n");
    return 1;
  }
  argv[0] = strdup("program.name");
  argv[1] = stddup("-e");
  argv[2] = getRandomString(50, 200);

  while ((result = getopt(3, argv, "e:")) != -1) {
    switch (result) {
    case 'e':
      strcpy(navfile, optarg); // Problem: If command line argument will be greater than 100 characters then stack buffer overflow will occur.
      break;
    default:
      break;
    }
  }

  free(argv[0]);
  free(argv[1]);
  free(argv[2]);
  free(argv);
}
