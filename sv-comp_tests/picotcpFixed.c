// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2021-33304/
// repository: https://github.com/virtualsquare/picotcp
// commit: f336ead
// extract of: modules/pico_fragments.c (function: pico_fragments_reassemble)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

#define PICO_PROTO_ICMP4 1
#define PICO_PROTO_IGMP 2
#define PICO_PROTO_TCP 6
#define PICO_PROTO_UDP 17
#define PICO_PROTO_ICMP6 58

struct pico_frame {
  char *proto;
};

void pico_frame_discard(struct pico_frame *f) {
  if (f) {
    if (f->proto) {
      free(f->proto);
    }
    free(f);
  }
}

int32_t pico_transport_receive(struct pico_frame *f, int proto) {
  int32_t ret = -1;
  switch (proto) {
  case PICO_PROTO_ICMP4:
    f->proto = strdup("ICMPV4");
    ret = 0;
    break;
  case PICO_PROTO_ICMP6:
    f->proto = strdup("ICMPV6");
    ret = 0;
    break;
  case PICO_PROTO_IGMP:
    f->proto = strdup("IGMP");
    ret = 0;
    break;
  case PICO_PROTO_UDP:
    f->proto = strdup("UDP");
    ret = 0;
    break;
  case PICO_PROTO_TCP:
    f->proto = strdup("TCP");
    ret = 0;
    break;
  default:
    /* Protocol not available */
    printf("pkt: no such protocol (%d)\n", proto);
    pico_frame_discard(f);
  }
  return ret;
}

static int pico_fragments_reassemble(int proto) {
  struct pico_frame *full = calloc(1, sizeof(struct pico_frame));
  if (full == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  full->proto = NULL;
  if (pico_transport_receive(full, proto) == -1) {
    return 1;
  }

  printf("Protocol: %s\n", full->proto);
  pico_frame_discard(full);

  return 0;
}

int main() {
  return pico_fragments_reassemble(getNumberInRange(1, 60));
}
