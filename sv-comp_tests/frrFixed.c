// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-41361/
// repository: https://github.com/FRRouting/frr
// commit: c2b0d6a
// extract of: bgpd/bgp_open.c (function: bgp_capability_software_version)

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "helpers.c"

#define BGP_MAX_SOFT_VERSION 64

int main() {
  char *version = getRandomString(10, 80);
  char *versionp = version;
  size_t verStringLength = strlen(version);
  uint8_t len = *versionp++;

  if (!len) {
    printf("Could not read version from argument string\n");
    free(version);
    return 1;
  }

  if (verStringLength - 1 < len) {
    printf("malformed version string\n");
    free(version);
    return 1;
  }

  if (len > BGP_MAX_SOFT_VERSION) {
    len = BGP_MAX_SOFT_VERSION;
  }

  char str[BGP_MAX_SOFT_VERSION + 1];
  memcpy(str, versionp, len);
  str[len] = '\0';
  printf("Extracted version: %s\n", str);
  free(version);
}
