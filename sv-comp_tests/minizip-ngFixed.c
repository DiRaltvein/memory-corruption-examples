// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-48106/
// repository: https://github.com/pmqs/minizip-ng
// commit: 97d8e65
// extract of: mz_os.c (function: mz_path_resolve)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

// function that resolves (simplifies) paths.
// if path is given as 'c:\test\123\..\abc.txt' it will get resolved to 'c:\test\abc.txt' ('c:\test\abc.txt' will be written into output buffer)
int mz_path_resolve(const char *path, char *output, int max_output) {
  const char *source = path;
  const char *check;
  char *target = output;

  if (max_output <= 0)
    return -1;

  while (*source != 0 && max_output > 1) {
    check = source;
    if ((*check == '\\') || (*check == '/'))
      check += 1;

    if ((source == path) || (target == output) || (check != source)) {
      if (*check == '.') {
        check += 1;

        /* Go to parent directory .. */
        if (*check == '.') {
          check += 1;
          if ((*check == 0) || (*check == '\\' || *check == '/')) {
            source += (check - source);

            /* Search backwards for previous slash */
            if (target != output) {
              target -= 1;
              do {
                if ((target == output) || (*target == '\\') || (*target == '/'))
                  break;

                target -= 1;
                max_output += 1;
              } while (target > output);
            }

            *target = 0;
            continue;
          }
        }
      }
    }

    *target = *source;

    source += 1;
    target += 1;
    max_output -= 1;
  }

  *target = 0;

  return 0;
}

int main() {
  char output[256];
  char *input = getRandomString(5, 200);
  if (mz_path_resolve(input, output, sizeof(output)) == 0) {
    printf("Resolved path: %s\n", output);
  } else {
    printf("Could not resolve path\n");
  }
  free(input);
}
