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

// the vulnerability can be triggered by producing a file with a giant line consisting of tabs
// it can be done by using command down below (taken from kilo github issue ticket https://github.com/antirez/kilo/issues/60)
// - python -c "print('\t'*477218598") > ./exp

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct erow {
  int size;
  int rsize;
  char *chars;
  char *render;
} erow;

enum KEY_ACTION{
  TAB = 9,
};

void editorUpdateRow(erow *row) {
    int tabs = 0, j, idx;

    for (j = 0; j < row->size; j++)
        if (row->chars[j] == TAB) tabs++;

    // integer overflow if row is very long with lots of tabs
    // resulting in a row->render buffer overflow on next buffer assignment calls
    row->render = malloc(row->size + tabs*8 + 1);
    if (row->render == NULL) {
      exit(1);
    }
    idx = 0;
    for (j = 0; j < row->size; j++) {
        if (row->chars[j] == TAB) {
            row->render[idx++] = ' ';
            while((idx+1) % 8 != 0) row->render[idx++] = ' ';
        } else {
            row->render[idx++] = row->chars[j];
        }
    }
    row->rsize = idx;
    row->render[idx] = '\0';
}

int main() {
  FILE* f = fopen("exp", "r");
  if (f == NULL) return 1;

  erow erow = {0};
  size_t linecap = 0;
  erow.size = getline(&erow.chars, &linecap, f);
  if (erow.size == -1) {
    fclose(f);
    return 1;
  }
  if (erow.size) {
    erow.chars[erow.size - 1] = '\0';
  }

  editorUpdateRow(&erow);

  printf("%s\n", erow.render);
  free(erow.render);
  fclose(f);
}
