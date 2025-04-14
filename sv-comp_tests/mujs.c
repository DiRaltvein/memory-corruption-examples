// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2021-33797/
// repository: https://github.com/ccxvii/mujs
// commit: 292415b
// extract of: jsdtoa.c (function: js_strtod)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

int main() {
  char *string = getRandomString(50, 500);
  int exp = 0;

  // convert string into number
  while ((*string >= '0') && (*string <= '9')) {
    exp = exp * 10 + (*string - '0'); // Problem: number from command line can be greater then an 4 byte int can hold. If big enough number is given signed integer overflow can happen
    string += 1;
  }

  printf("%d\n", exp);
}
