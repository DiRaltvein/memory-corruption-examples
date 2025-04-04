// https://www.cvedetails.com/cve/CVE-2022-47088/
// repository: https://github.com/gpac/gpac
// commit: 73a8c42
// extract of: src/media_tools/av_parsers.c (function: gf_vvc_read_pps_bs_internal)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_TILE_COLS 30

extern unsigned char __VERIFIER_nondet_uchar();

typedef uint64_t u64;
typedef uint32_t u32;

typedef struct
{
  u32 width;
  u32 num_tile_cols, pic_width_in_ctbsY;
  u32 tile_cols_width_ctb[MAX_TILE_COLS];
} VVC_PPS;

typedef struct {
  unsigned char *data;
  u64 size;
  u64 position;
} GF_BitStream;

/**
 * Just a utility function in test creation that generates random sequence of unsigned characters (sequence is not zero terminated)
 */
unsigned char *getRandomByteStream(int size) {
  unsigned char *randomString = (unsigned char*)calloc(size, sizeof(unsigned char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_uchar();
  }
  return randomString;
}

u32 readUnsignedIntFromBuffer(GF_BitStream *bs) {
  if (bs->position + 4 >= bs->size) {
    return 0;
  }
  bs->position += 4;
  return ((u32)bs->data[bs->position - 4]) | (((u32)bs->data[bs->position - 3]) << 8) | (((u32)bs->data[bs->position - 2]) << 16) | (((u32)bs->data[bs->position - 1]) << 24);
}

void gf_vvc_read_pps_bs_internal(GF_BitStream *bs, VVC_PPS *pps) {

  pps->width = readUnsignedIntFromBuffer(bs);

  u32 ctu_size = readUnsignedIntFromBuffer(bs);
  if (ctu_size > 30) {
    printf("malformed data\n");
    return;
  }
  u32 num_exp_tile_columns = 1 + readUnsignedIntFromBuffer(bs);

  ctu_size = 1 << ctu_size;
  pps->pic_width_in_ctbsY = pps->width / ctu_size;
  if (pps->pic_width_in_ctbsY * ctu_size < pps->width)
    pps->pic_width_in_ctbsY++;

  u32 nb_ctb_left = pps->pic_width_in_ctbsY;
  pps->num_tile_cols = 0;
  u32 nb_ctb_last = 0;
  for (size_t i = 0; i < num_exp_tile_columns && i < MAX_TILE_COLS; i++) {
    u32 nb_ctb_width = 1 + readUnsignedIntFromBuffer(bs);
    nb_ctb_left -= nb_ctb_width;
    pps->tile_cols_width_ctb[i] = nb_ctb_width;
    nb_ctb_last = nb_ctb_width;
    pps->num_tile_cols++;
  }

  u32 uni_size_ctb = nb_ctb_last;
  while (nb_ctb_left >= uni_size_ctb) {
    nb_ctb_left -= uni_size_ctb;
    pps->tile_cols_width_ctb[pps->num_tile_cols] = uni_size_ctb; // Problem: buffer overflow of pps->tile_cols_width_ctb buffer with fixed size of MAX_TILE_COLS
    pps->num_tile_cols++;
  }
}

int main() {
  VVC_PPS pps = {0};
  GF_BitStream bs = {0};

  bs.data = getRandomByteStream(20);
  bs.position = 0;
  bs.size = 20;

  gf_vvc_read_pps_bs_internal(&bs, &pps);

  free(bs.data);
}
