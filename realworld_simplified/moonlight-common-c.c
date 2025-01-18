// https://www.cvedetails.com/cve/CVE-2023-42801/
// repository: https://github.com/moonlight-stream/moonlight-common-c
// commit: 8b84d17
// extract of: src/Misc.c (function: extractVersionQuadFromString)

// same vulnerability as https://www.cvedetails.com/cve/CVE-2023-26767/

#include <string.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  char versionString[128];
  strcpy(versionString, argv[1]); // Problem: terminal parametr length can be greater than 128 characters that would result in a versionString buffer overflow
  printf("%s\n", versionString);
}
