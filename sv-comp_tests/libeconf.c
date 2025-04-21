// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-30078/
// repository: https://github.com/openSUSE/libeconf
// commit: dcfc789
// extract of: lib/libeconf.c (function: econf_writeFile)

#include <stdio.h>
#include <string.h>
#include "helpers.c"

#define BUFSIZE 32

int main() {
  char stringToCopy[BUFSIZE + 2] = "Books are windows to other worlds";
  char buf[BUFSIZE];
  char *line;
  char *value_string = buf;

  strncpy(buf, stringToCopy, BUFSIZE); // because stringToCopy is longer then the BUFSIZE no null terminator is appended to the buf when copying

  while ((line = strsep(&value_string, "\n")) != NULL) {
    printf("%s\n", line); // Problem: read out of bound. because buf is not null terminated strsep does not stop and goes further down the stack until another null byte is encountered.
  }
}
