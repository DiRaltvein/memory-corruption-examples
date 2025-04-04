// https://www.cvedetails.com/cve/CVE-2023-41361/
// repository: https://github.com/FRRouting/frr
// commit: c2b0d6a
// extract of: bgpd/bgp_open.c (function: bgp_capability_software_version)

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define BGP_MAX_SOFT_VERSION 64

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }

  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  randomString[0] = stringSize - 1;
  for (int i = 1; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}

int main() {
  char *version = getRandomString(10, 80);
  char *versionp = version;
  size_t verStringLength = strlen(version);
  uint8_t len = *versionp++;

  if (!len) {
    printf("Could not read version from argument string\n");
    free(version);
    return 1;
  }

  if (verStringLength - 1 < len) {
    printf("malformed version string\n");
    free(version);
    return 1;
  }

  if (len > BGP_MAX_SOFT_VERSION) {
    len = BGP_MAX_SOFT_VERSION;
  }

  char str[BGP_MAX_SOFT_VERSION + 1];
  memcpy(str, versionp, len);
  str[len] = '\0';
  printf("Extracted version: %s\n", str);
  free(version);
}
