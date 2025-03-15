// https://www.cvedetails.com/cve/CVE-2021-37778/
// repository: https://github.com/osqzss/gps-sdr-sim
// commit: d361b2c
// extract of: gpssim.c (function: main)

#include <getopt.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define MAX_CHAR (100)

extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

int main() {
  int result;
  char navfile[MAX_CHAR];
  navfile[0] = 0;

  int argc = getNumberInRange(3, 10);
  char **argv = calloc(argc, sizeof(char *));
  if (argv == NULL) {
    printf("Out of memory\n");
    return 1;
  }

  argv[0] = strdup("program.name");
  argv[1] = strdup("-e");

  for (int i = 2; i < argc; i++) {
    int size = getNumberInRange(5, 120);
    argv[i] = calloc(size + 1, sizeof(char));
    if (argv[i] == NULL) {
      freeArgv(argc, argv);
      printf("Out of memory\n");
      return 1;
    }

    memset(argv[i], 'a', size);
  }

  while ((result = getopt(argc, argv, "e:")) != -1) {
    switch (result) {
    case 'e':
      strcpy(navfile, optarg); // Problem: If command line argument will be greater than 100 characters then stack buffer overflow will occur.
      break;
    default:
      break;
    }
  }

  freeArgv(argc, argv);
}
