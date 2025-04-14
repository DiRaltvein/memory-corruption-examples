// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2020-28840/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: e64e904
// extract of: jpgfile.c (function: process_COM)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

typedef unsigned char uchar;
#define MAX_COMMENT_SIZE 200

static void process_COM(uchar *Data, int length) {
  int ch;
  char Comment[MAX_COMMENT_SIZE + 1];
  int nch;
  int a;

  nch = 0;

  if (length > MAX_COMMENT_SIZE)
    length = MAX_COMMENT_SIZE; // Truncate if it won't fit in our structure.

  for (a = 2; a < length; a++) {
    ch = Data[a];

    if (ch == '\r' && Data[a + 1] == '\n') // Problem: Data[a + 1] results in read out of bound by 1 byte in case \r is the last character in a string
      continue;                            // Remove cr followed by lf.

    if (ch >= 32 || ch == '\n' || ch == '\t') {
      Comment[nch++] = (char)ch;
    } else {
      Comment[nch++] = '?';
    }
  }

  Comment[nch] = '\0'; // Null terminate

  printf("COM marker comment: %s\n", Comment);
}

int main() {
  size_t dataSize = getNumberInRange(50, MAX_COMMENT_SIZE);
  uchar* data = getRandomByteStream(dataSize);
  process_COM(data, dataSize);
  free(data);
}
