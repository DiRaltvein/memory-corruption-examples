// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-31003/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 5f18366
// extract of: libsofia-sip-ua/sdp/sdp_parse.c (function: parse_message)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

int main() {
  char *record = getRandomString(0, 500);
  char field = record[0];
  char *rest = record + 2; // Problem: rest may be pointing to a memory after first argument effectively leading to a read out of bound in the next line

  switch (field) {
  case 'o':
  case 's':
  case 'i':
    printf("option o, value: %s", rest); // Problem: potentiall read out of bound or rest
    break;
  case 'c':
    while (*rest) {
      printf("%c", *rest); // Problem: potentiall read out of bound or rest
      rest++;
    }
  }

  free(record);
  printf("\n");
}
