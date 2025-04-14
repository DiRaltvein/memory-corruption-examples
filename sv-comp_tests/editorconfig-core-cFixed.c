// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-0341/
// repository: https://github.com/editorconfig/editorconfig-core-c
// commit: 412225d
// extract of: src/lib/ec_glob.c (function: ec_glob)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

/* concatenate the string then move the pointer to the end */
#define STRING_CAT(p, string, end)      \
  do {                                  \
    size_t string_len = strlen(string); \
    if (p + string_len >= end)          \
      return;                           \
    strcat(p, string);                  \
    p += string_len;                    \
  } while (0)

#define ADD_CHAR(string, new_chr, end) \
  do {                                 \
    if (string + 1 >= end)             \
      return;                          \
    *(string++) = new_chr;             \
  } while (0)

#define PATTERN_MAX 40

void ec_glob(char *pattern) {
  char *c;
  char pcre_str[2 * PATTERN_MAX] = "^";
  char *p_pcre;
  char *pcre_str_end;

  p_pcre = pcre_str + 1;
  pcre_str_end = pcre_str + 2 * PATTERN_MAX;

  for (c = pattern; *c; ++c) {
    switch (*c) {
    case '?':
      STRING_CAT(p_pcre, "[^/]", pcre_str_end);
      break;
    default:
      ADD_CHAR(p_pcre, *c, pcre_str_end);
    }
  }

  printf("pcre_str: %s\n", pcre_str);
}

int main() {
  char* randomString = getRandomString(5, 70);
  ec_glob(randomString);
  free(randomString);
}
