// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-31976/
// repository: https://github.com/libming/libming
// commit: 04aee52
// extract of: libming/util/makeswf.c (function: makeswf_preprocess)

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

#define CPP "cpp -xc++ -P -Wall"
#define DEFSWFVERSION 6

static int swfversion = DEFSWFVERSION;
char *outputfile = "out.swf";

static void makeswf_preprocess(const char *file, const char *out) {
  char buf[128];
  sprintf(buf, "%s -D__SWF_VERSION__=%d %s > %s", CPP, swfversion, file, out); // Problem: potential buf overflow

  printf("Formatted buffer: %s\n", buf);
}

int main() {
  char* filename = getRandomString(0, 150);
  char ppfile[4096] = {0};
  sprintf(ppfile, "%s.frame5.pp", outputfile);
  makeswf_preprocess(filename, ppfile);
  free(filename);
}
