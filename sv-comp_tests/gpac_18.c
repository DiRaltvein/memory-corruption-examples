// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-23143/
// repository: https://github.com/gpac/gpac
// commit: 78b76fa
// extract of: src/media_tools/av_parsers.c (function: avc_parse_slice)

#include <stdio.h>
#include <stdlib.h>
#include "helpers.c"

typedef struct
{
  int profile_idc;
} AVC_SPS;

typedef struct
{
  int sps_id;
} AVC_PPS;

typedef struct
{
  AVC_SPS sps[32]; /* range allowed in the spec is 0..31 */
} AVCState;

typedef struct
{
  AVC_SPS *sps;
  AVC_PPS *pps;
} AVCSliceInfo;

void avc_parse_slice(AVCSliceInfo *si, AVCState *avc) {
  if (si->pps->sps_id >= 255)
    return;
  si->sps = &avc->sps[si->pps->sps_id]; // Problem: accessing index between 5 and 255 (si->pps->sps_id) of array with length of 32 (avc->sps)
  printf("Prodile idc: %d\n", si->sps->profile_idc);
}

int main() {
  AVCSliceInfo si = {0};
  si.pps = calloc(1, sizeof(AVC_PPS));
  if (si.pps == NULL)
    return 1;
  si.pps->sps_id = getNumberInRange(0, 35); // value >= 32 will cause a buffer overflow later in program

  AVCState avc = {0};
  for (int i = 0; i < 32; i++) {
    avc.sps[i].profile_idc = i;
  }

  avc_parse_slice(&si, &avc);
  free(si.pps);
}
