// https://www.cvedetails.com/cve/CVE-2023-42801/
// repository: https://github.com/moonlight-stream/moonlight-common-c
// commit: 8b84d17
// extract of: src/Misc.c (function: extractVersionQuadFromString)

// same vulnerability as https://www.cvedetails.com/cve/CVE-2023-26767/
// same vulnerability as https://www.cvedetails.com/cve/CVE-2023-26769/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int extractVersionQuadFromString(const char *string, int *quad) {
  char versionString[128];
  char *nextDot;
  char *nextNumber;
  int i;

  strcpy(versionString, string); // Problem: passed version string may be greater than 128 characters leading to versionString buffer overflow
  nextNumber = versionString;

  for (i = 0; i < 4; i++) {
    if (i == 3) {
      nextDot = strchr(nextNumber, '\0');
    } else {
      nextDot = strchr(nextNumber, '.');
    }
    if (nextDot == NULL) {
      return -1;
    }

    // Cut the string off at the next dot
    *nextDot = '\0';

    quad[i] = atoi(nextNumber);

    // Move on to the next segment
    nextNumber = nextDot + 1;
  }

  return 0;
}

int main(int argc, char *argv[]) {
  if (argc == 1) {
    printf("Usage: %s <version string in format major.minor.patch.build (example 5.12.652.1)", argv[0]);
    return 1;
  }

  int quad[4] = {0};
  if (extractVersionQuadFromString(argv[1], quad) == 0) {
    printf("Successfully parsed version string. Major: %d, minor: %d, patch: %d, build: %d.\n", quad[0], quad[1], quad[2], quad[3]);
  } else {
    printf("Could not extract versions from passed string\n");
  }
}
