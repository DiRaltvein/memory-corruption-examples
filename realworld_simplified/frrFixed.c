// https://www.cvedetails.com/cve/CVE-2023-41361/
// repository: https://github.com/FRRouting/frr
// commit: c2b0d6a
// extract of: bgpd/bgp_open.c (function: bgp_capability_software_version)

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define BGP_MAX_SOFT_VERSION 64

int main() {
  char version[] = "\x60Version string that is a little bit longer then program expects but nevertheless the whole string length is greater then the length specified in the beggining of the string.";
  char *versionp = (char *)version;
  size_t verStringLength = strlen(version);
  uint8_t len = *versionp++;

  if (!len) {
    printf("Could not read version from argument string\n");
    return 1;
  }

  if (verStringLength - 1 < len) {
    printf("malformed version string\n");
    return 1;
  }

  if (len > BGP_MAX_SOFT_VERSION) {
    len = BGP_MAX_SOFT_VERSION;
  }

  char str[BGP_MAX_SOFT_VERSION + 1];
  memcpy(str, versionp, len); // Problem: len can be greater than str size resulting in a buffer overflow
  str[len] = '\0';
  printf("Extracted version: %s\n", str);
}
