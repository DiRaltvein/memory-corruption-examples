// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-49287/
// repository: https://github.com/cxong/tinydir
// commit: 74acffd
// extract of: tinydir.h (function: tinydir_file_open)

// Similar vulnerabilities:
// - https://www.cvedetails.com/cve/CVE-2023-50965/
// - https://www.cvedetails.com/cve/CVE-2021-46901/

#include <libgen.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "helpers.c"

#define _TINYDIR_PATH_MAX 4096
#define _TINYDIR_FILENAME_MAX 256


int tinydir_file_open(const char *path) {
  char dir_name_buf[_TINYDIR_PATH_MAX];
  char file_name_buf[_TINYDIR_FILENAME_MAX];
  char *dir_name;
  char *base_name;

  if (path == NULL || strlen(path) == 0 || strlen(path) >= _TINYDIR_PATH_MAX) {
    return -1;
  }

  /* Get the parent path */
  strcpy(dir_name_buf, path);
  dir_name = dirname(dir_name_buf);
  strcpy(file_name_buf, path); // Problem path length can be greater than 256 leading to stack buffer oveflow of file_name_buf buffer
  base_name = basename(file_name_buf);
  if ((strcmp(base_name, "/")) == 0) {
    printf("Folder path provided: %s\n", dir_name);
  } else {
    printf("File path provided: %s\n", base_name);
  }

  return 0;
}

int main() {
  char* path = getRandomString(5, 500);
  if (tinydir_file_open(path) == -1) {
    printf("Error");
  }
  free(path);
}
