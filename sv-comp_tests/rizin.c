// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-27590/
// repository: https://github.com/rizinorg/rizin
// commit: e7eae14
// extract of: librz/reg/profile.c (function: gdb_to_rz_profile)

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "helpers.c"

static void gdb_to_rz_profile(const char *gdb) {
  char *ptr1;
  char name[16], groups[128], type[16];
  int ret, typei;

  const char *ptr = gdb;
  for (;;) {
    // Skip whitespace at beginning of line and empty lines
    while (isspace(*ptr)) {
      ptr++;
    }
    if (!*ptr) {
      break;
    }
    if ((ptr1 = strchr(ptr, '\n'))) {
      *ptr1 = '\0';
    } else {
      printf("Could not parse line: %s (missing \\n)\n", ptr);
      return;
    }
    ret = sscanf(ptr, " %s %d %s %s", name, &typei, type, groups); // Problem: sscanf may overflow name, groups or type buffer when reading from ptr
    if (ret < 4) {
      printf("Could not parse line: %s\n", ptr);
      ptr = ptr1 + 1;
      continue;
    }

    printf("Parsed values: ");
    printf("name: %s, ", name);
    printf("groups: %s, ", groups);
    printf("type: %s, ", type);
    printf("type as number: %d\n", typei);

    ptr = ptr1 + 1;
    continue;
  }
}

int main() {
  // char data[] = "rax 0  general all\n \
  //                xmm0 17 float sse\n \
  //                st0 33 SomeValueThatIsLongerThan16Bytes fpu\n";
  char* data = getRandomString(5, 1000);

  gdb_to_rz_profile(data);

  free(data);
}
