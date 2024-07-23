// https://www.cvedetails.com/cve/CVE-2023-41361/
// repository: https://github.com/FRRouting/frr
// commit: c2b0d6a
// extract of: bgpd/bgp_open.c (function: bgp_capability_software_version)

#include <string.h>

int main(int argc, char *argv[]) {
  if (argc == 1) { // first argument is executable file name so make sure there is at least 1 parametr given
    return 0;
  }

  char str[65];
  strncpy(str, argv[1], strlen(argv[1])); // Problem: terminal parametr length can be greater than 65
}
