// https://www.cvedetails.com/cve/CVE-2022-47088/
// repository: https://github.com/gpac/gpac
// commit: 73a8c42
// extract of: src/media_tools/av_parsers.c (function: gf_vvc_read_pps_bs_internal)

#include <stdint.h>
#include <stdio.h>

#define MAX_TILE_COLS 10

typedef uint32_t u32;

typedef struct
{
  u32 num_tile_cols, pic_width_in_ctbsY, uni_size_ctb;
  u32 tile_cols_width_ctb[MAX_TILE_COLS];
} VVC_PPS;

void gf_vvc_read_pps_bs_internal(VVC_PPS *pps) {
  while (pps->pic_width_in_ctbsY >= pps->uni_size_ctb) {
    pps->pic_width_in_ctbsY -= pps->uni_size_ctb;
    pps->tile_cols_width_ctb[pps->num_tile_cols] = pps->uni_size_ctb; // Problem: buffer overflow of pps->tile_cols_width_ctb
    pps->num_tile_cols++;
  }
}

int main(int argc, char *argv[]) {
  VVC_PPS pps;
  pps.pic_width_in_ctbsY = 30;
  pps.uni_size_ctb = argc;
  pps.num_tile_cols = 0;
  gf_vvc_read_pps_bs_internal(&pps);
}
