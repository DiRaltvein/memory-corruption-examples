// https://www.cvedetails.com/cve/CVE-2023-25221/
// repository: https://github.com/strukturag/libde265
// commit: a050853
// extract of: libde265/motion.cc (function: derive_spatial_luma_vector_prediction)

#include <ctime>    // time
#include <stdio.h>  // printf
#include <stdlib.h> // rand

int getAnInt(int max) {
  return rand() % (max + 1);
}

typedef struct {
  char refIdx[2]; // index into LongTermRefPic
} PBMotion;

typedef struct {
  char LongTermRefPic[2][16];
} slice_segment_header;

int derive_spatial_luma_vector_prediction(const slice_segment_header *shdr, char X) {
  PBMotion vi;
  vi.refIdx[X] = getAnInt(20);

  if (shdr->LongTermRefPic[X][vi.refIdx[X]] == 'a') // Problem: in case random number is greater then 15 subarray will be accessed out of bound
    return -1;

  return 0;
}

int main(int argc, char *argv[]) {
  srand(time(0));
  slice_segment_header shdr = {0};
  derive_spatial_luma_vector_prediction(&shdr, 1);
}
