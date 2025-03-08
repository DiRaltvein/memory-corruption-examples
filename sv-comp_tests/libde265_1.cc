// https://www.cvedetails.com/cve/CVE-2023-25221/
// repository: https://github.com/strukturag/libde265
// commit: a050853
// extract of: libde265/motion.cc (function: derive_spatial_luma_vector_prediction)

// same issue as:
// - https://www.cvedetails.com/cve/CVE-2023-49465/
// - https://www.cvedetails.com/cve/CVE-2023-49467/

#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int refIdx[2]; // index into LongTermRefPic
} PBMotion;

typedef struct {
  char LongTermRefPic[2][16];
} slice_segment_header;

int derive_spatial_luma_vector_prediction(const slice_segment_header *shdr, int X, int argc) {
  PBMotion vi = {0};
  vi.refIdx[X] = argc;

  if (shdr->LongTermRefPic[X][vi.refIdx[X]] == 'a') // Problem: in case random number is greater then 15 subarray will be accessed out of bound
    return -1;

  return 0;
}

int main(int argc, char *argv[]) {
  slice_segment_header shdr = {0};
  derive_spatial_luma_vector_prediction(&shdr, argc > 5 ? 0 : 1, argc);
}
