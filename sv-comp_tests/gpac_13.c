// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-47657/
// repository: https://github.com/gpac/gpac
// commit: 348d772
// extract of: src/media_tools/av_parsers.c (function: hevc_parse_vps_extension)

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
  uint32_t layer_id_in_nuh[MAX_LHVC_LAYERS];
  uint32_t layer_id_in_vps[MAX_LHVC_LAYERS];
  int max_layers;
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

void hevc_parse_vps_extension(HEVC_VPS *vps, GF_BitStream *bs) {
  uint8_t vps_nuh_layer_id_present_flag = gf_bs_read_int_log(bs, 1);
  vps->layer_id_in_nuh[0] = 0;
  vps->layer_id_in_vps[0] = 0;
  for (int i = 1; i < vps->max_layers; i++) {
    if (vps_nuh_layer_id_present_flag) {
      vps->layer_id_in_nuh[i] = gf_bs_read_int_log(bs, 6);
    } else {
      vps->layer_id_in_nuh[i] = i;
    }
    vps->layer_id_in_vps[vps->layer_id_in_nuh[i]] = i; // Problem: pontential buffer overflow of layer_id_in_vps if gf_bs_read_int_log(bs, 6); returns a number greater than 3
  }
}

int main() {
  HEVC_VPS vps;
  vps.max_layers = 4;
  GF_BitStream bs = initializeStream("./gpac_13.hex");

  hevc_parse_vps_extension(&vps, &bs);

  fclose(bs.stream);
}
