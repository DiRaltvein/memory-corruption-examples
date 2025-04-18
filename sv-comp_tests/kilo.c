// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2020-20335/
// repository: https://github.com/antirez/kilo
// commit: 0099562
// extract of: kilo.c (function: editorUpdateRow)

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include "helpers.c"

enum KEY_ACTION{
  TAB = 9,
};

void editorUpdateRow(char* string) {
  int tabs = 0, j;
  size_t length = strlen(string);

  for (j = 0; j < length; j++)
    if (string[j] == TAB) tabs++;

  // integer overflow if row is very long with lots of tabs
  printf("Line length with tabs substituted to spaces: %ld\n", length + tabs*8 + 1);
}

int main() {
  char* str = getRandomString(0, INT_MAX);
  editorUpdateRow(str);
  free(str);
}
