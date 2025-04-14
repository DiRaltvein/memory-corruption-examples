// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-4899/
// repository: https://github.com/facebook/zstd
// commit: 1b445c1
// extract of: programs/util.c (function: mallocAndJoin2Dir)

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#include "helpers.c"

#define PATH_SEP '/'

char *mallocAndJoin2Dir(const char *dir1, const char *dir2) {
  assert(dir1 != NULL && dir2 != NULL);

  const size_t dir1Size = strlen(dir1);
  const size_t dir2Size = strlen(dir2);
  char *outDirBuffer, *buffer;

  outDirBuffer = (char *)malloc(dir1Size + dir2Size + 2);
  if (outDirBuffer == NULL) {
    printf("Out of memory!\n");
    exit(1);
  }

  memcpy(outDirBuffer, dir1, dir1Size);
  outDirBuffer[dir1Size] = '\0';

  if (dir2[0] == '.')
    return outDirBuffer;

  buffer = outDirBuffer + dir1Size;
  if (dir1Size > 0 && *(buffer - 1) != PATH_SEP) {
    *buffer = PATH_SEP;
    buffer++;
  }
  memcpy(buffer, dir2, dir2Size);
  buffer[dir2Size] = '\0';

  return outDirBuffer;
}

int main() {
  char *dir1 = getRandomString(0, 100);
  char* dir2 = getRandomString(0, 100);
  char* joinedDirs = mallocAndJoin2Dir(dir1, dir2);
  printf("%s\n", joinedDirs);
  free(dir1);
  free(dir2);
  free(joinedDirs);
}
