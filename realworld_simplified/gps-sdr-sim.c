// https://www.cvedetails.com/cve/CVE-2021-37778/
// repository: https://github.com/osqzss/gps-sdr-sim
// commit: d361b2c
// extract of: gpssim.c (function: main)

// file can be executes as ./a.out -e <some value that if greater than 100 characters program buffer overflows>

#include <string.h>
#include <getopt.h>

#define MAX_CHAR (100)


int main(int argc, char *argv[]) {
  int result;
  char navfile[MAX_CHAR];
  navfile[0] = 0;

  while ((result = getopt(argc, argv, "e:")) != -1) {
    switch (result) {
    case 'e':
      strcpy(navfile, optarg); // Problem: If command line argument will be greater than 100 characters then stack buffer overflow will occur.
      break;
    default:
      break;
    }
  }
}
