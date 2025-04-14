// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-25076/
// repository: https://github.com/dlundquist/sniproxy
// commit: 822bb80
// extract of: src/address.c (function: new_address)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

int main() {
  char *hostname_or_ip = getRandomString(5, 500);
  char *port;
  char ip_buf[262];
  size_t len;

  // try to parse hostname_or_ip like it is an ipv6 address of form [2001:db8:3333:4444:5555:6666:7777:8888]:443
  if (hostname_or_ip[0] == '[' &&
      (port = strchr(hostname_or_ip, ']')) != NULL) {
    len = (size_t)(port - hostname_or_ip - 1);

    strncpy(ip_buf, hostname_or_ip + 1, len); // Problem: in case ipv6 address is malformed and is larger than the ip_buf buffer, buffer will overflow
    ip_buf[len] = '\0';

    printf("%s\n", ip_buf);
  }

  free(hostname_or_ip);
}
