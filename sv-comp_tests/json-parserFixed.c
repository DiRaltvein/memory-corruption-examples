// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-23088/
// repository: https://github.com/Barenboim/json-parser
// commit: fc599bf
// extract of: json_parser.c (function: __parse_json_members)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

static int __json_string_length(const char *cursor) {
  int len = 0;

  while (1) {
    if (*cursor == '\"')
      break;

    if (*(const unsigned char *)cursor < ' ')
      return -2;

    cursor++;
    if (cursor[-1] == '\\') {
      if (!*cursor)
        return -2;

      cursor++;
    }

    len++;
  }

  return len;
}

int __parse_json_members(const char *cursor, const char **end) {
  if (*cursor != '{') {
    return -1;
  }

  cursor++;

  while (1) {
    if (*cursor != '\"') {
      return -1;
    }

    cursor++;
    int len = __json_string_length(cursor);
    if (len < 0) {
      return -1;
    }

    char *value = calloc(len + 1, sizeof(char));
    if (!value) {
      printf("Out of memory!\n");
      return -1;
    }

    memcpy(value, cursor, len);
    printf("%s\n", value);
    free(value);

    cursor += len + 1;

    if (*cursor == ',') {
      cursor++;
    } else if (*cursor == '}') {
      break;
    } else {
      return -2;
    }
  }

  *end = cursor + 1;
  return 0;
}

// Extract of functionality that parses json
// Extracted functionality only parses strings that are not actually formatted as json but are rather in a format "{\"<string1>\",\"<string2>\",\"<string3>\"...}"
// after finishing with parsing string algorithm also checks whether after closing bracket } any data follows and if it does then input is condidered 'invalid'.
// logic is pretty much the same as with json where you have one object {...} and nothing can follow after it otherwise json input is invalid
int main() {
  // char doc[] = "{\"Hello\",\"World\",\"!\"}"; // valid input
  char *randomString = getRandomString(5, 500);
  const char *docp = randomString;

  int ret = __parse_json_members(docp, &docp);
  if (ret >= 0) {
    // 0x20 is a space character
    while (*docp == 0x20) {
      docp++;
    }

    if (*docp) {
      printf("Invalid input\n");
    }
  }
  free(randomString);
}
