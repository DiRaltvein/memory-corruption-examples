// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-47658/
// repository: https://github.com/gpac/gpac
// commit: 9f1e633
// extract of: src/media_tools/av_parsers.c (function: gf_hevc_read_vps_bs_internal)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_LHVC_LAYERS 4
#define gf_bs_read_int_log(_bs, _nBits) gf_bs_read_int(_bs, _nBits)

typedef struct {
  FILE *stream;
  uint8_t current;
  int nbBits;
} GF_BitStream;

typedef struct {
  uint32_t max_layer_id, num_layer_sets;
} HEVC_VPS;

uint8_t gf_bs_read_bit(GF_BitStream *bs) {
  if (bs->nbBits == 0) {
    int byte = fgetc(bs->stream);
    if (byte == EOF) {
      exit(1);
    }
    bs->current = (uint8_t)byte;
    bs->nbBits = 8;
  }
  uint8_t ret = (bs->current >> (bs->nbBits - 1)) & 1;
  bs->nbBits--;
  return ret;
}

uint32_t gf_bs_read_int(GF_BitStream *bs, uint32_t nBits) {
  uint32_t ret = 0;

  while (nBits-- > 0) {
    ret <<= 1;
    ret |= gf_bs_read_bit(bs);
  }
  return ret;
}

GF_BitStream initializeStream(const char *filename) {
  GF_BitStream bs;
  bs.stream = fopen(filename, "rb");
  if (bs.stream == NULL)
    exit(1);
  bs.current = 0;
  bs.nbBits = 0;
  return bs;
}

int gf_hevc_read_vps_bs_internal(HEVC_VPS *vps, GF_BitStream *bs) {
  uint8_t layer_id_included_flag[MAX_LHVC_LAYERS][MAX_LHVC_LAYERS];

  vps->max_layer_id = gf_bs_read_int_log(bs, 4);
  if (vps->max_layer_id > MAX_LHVC_LAYERS) {
    return -1;
  }
  vps->num_layer_sets = gf_bs_read_int_log(bs, 4);
  if (vps->num_layer_sets > MAX_LHVC_LAYERS) {
    return -1;
  }

  for (uint32_t i = 0; i < vps->num_layer_sets; i++) {
    for (uint32_t j = 0; j <= vps->max_layer_id; j++) {
      layer_id_included_flag[i][j] = gf_bs_read_int_log(bs, 1); // Problem: i can go up to 4 that is invalid index for layer_id_included_flag[i] resulting in access out of bounds
    }
  }

  int sum = 0;
  for (uint32_t i = 0; i < vps->num_layer_sets; i++) {
    for (uint32_t j = 0; j <= vps->max_layer_id; j++) {
      sum += layer_id_included_flag[i][j]; // Same problem when counting sum
    }
  }
  return sum;
}

int main() {
  HEVC_VPS vps;
  GF_BitStream bs = initializeStream("./gpac_14.hex");

  int sum = gf_hevc_read_vps_bs_internal(&vps, &bs);
  printf("%d\n", sum);

  fclose(bs.stream);
}
