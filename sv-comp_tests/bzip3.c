// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-29421/
// repository: https://github.com/kspalaiologos/bzip3
// commit: 8d433c4
// extract of: src/libbz3.c (function: bz3_decode_block)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

typedef uint8_t u8;
typedef uint32_t u32;
typedef int32_t s32;
typedef int8_t s8;

struct bz3_state {
  s32 block_size;
  s8 last_error;
};

#define KiB(x) ((x) * 1024)

u32 bz3_bound(u32 input_size) { return input_size + input_size / 50 + 32; }

static s32 read_neutral_s32(const u8 *data) {
  return ((u32)data[0]) | (((u32)data[1]) << 8) | (((u32)data[2]) << 16) | (((u32)data[3]) << 24);
}

struct bz3_state *bz3_new(s32 block_size) {
  if (block_size < 0x10 || block_size > KiB(65)) {
    return NULL;
  }

  struct bz3_state *bz3_state = (struct bz3_state *)malloc(sizeof(struct bz3_state));
  if (!bz3_state) {
    return NULL;
  }

  bz3_state->block_size = block_size;
  bz3_state->last_error = 0;

  return bz3_state;
}

void bz3_decode_block(struct bz3_state *state, u8 *buffer, s32 data_size, s32 orig_size) {
  if (data_size > bz3_bound(state->block_size) || data_size < 1) {
    state->last_error = 1;
    return;
  }

  s8 model = *buffer;
  s32 lzp_size = -1;

  if (model & 2 && data_size >= 5) {
    lzp_size = read_neutral_s32(buffer + 1);
  }

  if (((model & 2) && (lzp_size > bz3_bound(state->block_size) || lzp_size < 0))) {
    state->last_error = 1;
    return;
  }

  if (orig_size > bz3_bound(state->block_size) || orig_size < 0) {
    state->last_error = 1;
    return;
  }

  s32 size_src;
  if (model & 2)
    size_src = lzp_size;
  else
    size_src = orig_size;

  u8 *b1 = (u8*)malloc(size_src);
  if(b1 == NULL) {
    state->last_error = 1;
    free(b1);
    return;
  }
  memset(b1, 0x46, size_src);

  state->last_error = 0;

  if (size_src > bz3_bound(state->block_size) || size_src < 0) {
    state->last_error = 1;
    free(b1);
    return;
  }

  memcpy(buffer, b1, size_src); // Problem: buffer overflow size_src can be greater than state->block_size
  free(b1);
}

int bz3_decompress(const uint8_t *in, uint8_t *out, u32 in_size, u32 *out_size) {
  if (in_size < 13)
    return 1;
  if (in[0] != 'B' || in[1] != 'Z' || in[2] != '3' || in[3] != 'v' || in[4] != '1') {
    return 1;
  }
  u32 block_size = read_neutral_s32(in + 5);
  u32 n_blocks = read_neutral_s32(in + 9);
  in_size -= 13;
  in += 13;

  struct bz3_state *state = bz3_new(block_size);
  if (!state)
    return 1;

  u8 *compression_buf = (u8 *)malloc(block_size);
  if (!compression_buf) {
    free(state);
    return 1;
  }

  u32 buf_max = *out_size;
  *out_size = 0;

  for (u32 i = 0; i < n_blocks; i++) {
    if (in_size < 8) {
    malformed_header:
      free(state);
      free(compression_buf);
      return 1;
    }

    s32 size = read_neutral_s32(in);
    if (size < 0 || size > block_size || in_size < size + 8) {
      goto malformed_header;
    }

    s32 orig_size = read_neutral_s32(in + 4);
    if (orig_size < 0 || buf_max < *out_size + orig_size) {
      goto malformed_header;
    }

    memcpy(compression_buf, in + 8, size);
    bz3_decode_block(state, compression_buf, size, orig_size);
    if (state->last_error != 0) {
      goto malformed_header;
    }
    memcpy(out + *out_size, compression_buf, orig_size);
    *out_size += orig_size;
    in += size + 8;
    in_size -= size + 8;
  }

  free(state);
  free(compression_buf);
  return 0;
}

int main() {
  // unsigned char data[] = {
  //   0xFF, 0x00, 0x00, 0x00,       // orig_size
  //   0x42, 0x5A, 0x33, 0x76, 0x31, // BZ3v1
  //   0x32, 0x00, 0x00, 0x00,       // block size
  //   0x01, 0x00, 0x00, 0x00,       // number of blocks

  //   0x32, 0x00, 0x00, 0x00, // block 1 size
  //   0x32, 0x00, 0x00, 0x00, // block 1 original size

  //   0x02, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // block 1 data
  //   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // block 1 data
  //   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // block 1 data
  //   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // block 1 data
  //   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // block 1 data
  // };

  // const uint8_t *in = (uint8_t *)data;
  // u32 in_size = sizeof(data) / sizeof(data[0]);

  u32 in_size = (u32)getNumberInRange(50, 5000);
  uint8_t *in = getRandomByteStream(in_size);

  u32 orig_size = *(u32 *)in;
  uint8_t *outbuf = (uint8_t *)calloc(orig_size, sizeof(uint8_t));
  if (outbuf == NULL) {
    free(in);
    return 1;
  }

  if (bz3_decompress(in + sizeof(u32), outbuf, in_size - sizeof(u32), &orig_size) != 0) {
    printf("decompression failed\n");
    free(outbuf);
    free(in);
    return 1;
  }

  printf("OK, %u => %u\n", in_size, orig_size);
  free(outbuf);
  free(in);
}
