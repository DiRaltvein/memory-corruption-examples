// https://www.cvedetails.com/cve/CVE-2023-42801/
// repository: https://github.com/moonlight-stream/moonlight-common-c
// commit: 8b84d17
// extract of: src/Misc.c (function: extractVersionQuadFromString)

// same vulnerability as https://www.cvedetails.com/cve/CVE-2023-26767/
// same vulnerability as https://www.cvedetails.com/cve/CVE-2023-26769/

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

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

int main() {
  char* versionString = getRandomString(5, 150);

  int quad[4] = {0};
  if (extractVersionQuadFromString(versionString, quad) == 0) {
    printf("Successfully parsed version string. Major: %d, minor: %d, patch: %d, build: %d.\n", quad[0], quad[1], quad[2], quad[3]);
  } else {
    printf("Could not extract versions from passed string\n");
  }
  free(versionString);
}
