// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-47656/
// repository: https://github.com/gpac/gpac
// commit: 1967ff2
// extract of: src/media_tools/av_parsers.c (function: gf_hevc_read_sps_bs_internal)

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_LAYERS 16
#define gf_bs_read_int_log(_bs, _nBits) gf_bs_read_int(_bs, _nBits)

typedef struct {
  FILE *stream;
  uint8_t current;
  int nbBits;
  uint32_t total_bits_read;
} GF_BitStream;

typedef struct {
  int rep_format_idx[MAX_LAYERS];
  int rep_formats[MAX_LAYERS];
} HEVC_VPS;

typedef struct {
  int rep_format_idx;
  uint8_t update_rep_format_flag;
} HEVC_SPS;

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
  bs->total_bits_read += nBits;

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
  bs.total_bits_read = 0;
  return bs;
}

int32_t gf_hevc_read_sps_bs_internal(GF_BitStream *bs, HEVC_SPS *sps, HEVC_VPS *vps, uint8_t layer_id) {
  uint8_t sps_ext_or_max_sub_layers_minus1 = 0;
  sps_ext_or_max_sub_layers_minus1 = gf_bs_read_int_log(bs, 3);
  bool multiLayerExtSpsFlag = (layer_id != 0) && (sps_ext_or_max_sub_layers_minus1 == 7);
  if (multiLayerExtSpsFlag) {
    sps->update_rep_format_flag = gf_bs_read_int_log(bs, 1);
    if (sps->update_rep_format_flag) {
      sps->rep_format_idx = gf_bs_read_int_log(bs, 8);
      if (sps->rep_format_idx > 15) {
        return -1;
      }
    } else {
      sps->rep_format_idx = vps->rep_format_idx[layer_id];
    }
    return vps->rep_formats[sps->rep_format_idx]; // Problem: buffer overflow accessing rep_formats with index of 20
  }
  return 1;
}

int main() {
  HEVC_VPS vps;
  HEVC_SPS sps;
  GF_BitStream bs = initializeStream("./gpac_12.hex");

  for (int i = 0; i < MAX_LAYERS; i++) {
    vps.rep_format_idx[i] = i * 2;
    vps.rep_formats[i] = i;
  }

  int32_t returnedInt = gf_hevc_read_sps_bs_internal(&bs, &sps, &vps, 10);
  printf("Returned: %d\n", returnedInt);

  fclose(bs.stream);
}
