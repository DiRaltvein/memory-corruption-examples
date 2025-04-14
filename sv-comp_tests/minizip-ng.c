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

// mz_path_resolve function can write out of bound of the memory segment where output pointer points. The write out of bound is only 1 byte before the buffer.
// eg if output points to 0x000020 then 0x000019 can be overwritten

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
              target -= 1; // Problem: do while loop substracts target 2 times and because of that target pointer goes out of bound of the output buffer
              do {
                if ((*target == '\\') || (*target == '/'))
                  break;

                target -= 1; // second substraction of the same pointer
                max_output += 1;
              } while (target > output);
            }

            // after do while loop target may be out of bound because if initial addresses were as follows:
            // output: 0x000020
            // target: 0x000021
            // then after do while loop target will point to address 0x00019 that will be out of bound

            *target = 0; // write out of bound
            continue;
          }
        }
      }
    }

    *target = *source; // write out of bound

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
