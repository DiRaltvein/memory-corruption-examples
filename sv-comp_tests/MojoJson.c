// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-23086/
// repository: https://github.com/scottcgi/MojoJson
// commit: be503f8
// extract of: Json.c (function: SkipString)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

int SkipString(char **jsonPtr, char **outStrStart) {
  // skip '"'
  char *json = ++(*jsonPtr);
  int count = 0;
  char c;

  // check end '"'
  while ((c = json[count++]) != '"') { // Problem: looking for a closing " to determine string bound but if there is no closing " provided then json[count++] buffer access will result in a buffer overflow
    if (c == '\\') {
      // skip escaped quotes
      // the escape char may be '\"'，which will break while
      ++count;
    }
  }

  *outStrStart = json;

  // already skipped the string end '"'
  *jsonPtr += count;

  // how many char skipped
  // count contains the string end '"', so -1
  return count - 1;
}

void ParseString(char **jsonPtr) {
  if (*(*jsonPtr) != '"') {
    printf("String must be between double quotes and the first element must be thus a double quote\n");
    return;
  }
  char *strStart;
  int length = SkipString(jsonPtr, &strStart);
  char *string = calloc(length + 1, sizeof(char));
  if (!string) {
    printf("Out of memory!\n");
    return;
  }
  memcpy(string, strStart, length);
  printf("%s\n", string);
  free(string);
}

// to break application pass any string as a first parametr that starts with " and where is no closing "
// for example \"123
int main() {
  char* randomString = getRandomString(5, 500);
  char* copy = randomString;
  ParseString(&copy);
  free(randomString);
}
