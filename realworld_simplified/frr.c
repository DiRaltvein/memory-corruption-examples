// https://www.cvedetails.com/cve/CVE-2023-41361/
// repository: https://github.com/FRRouting/frr
// commit: c2b0d6a
// extract of: bgpd/bgp_open.c (function: bgp_capability_software_version)

#include <string.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  char str[65];
  size_t len = strlen(argv[1]);
  memcpy(str, argv[1], len); // Problem: terminal parametr length can be greater than 65 characters that would result in a str buffer overflow
  str[len] = '\0';
  printf("%s\n", str);
}
