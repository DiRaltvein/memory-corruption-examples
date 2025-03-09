// https://www.cvedetails.com/cve/CVE-2022-33065/
// repository: https://github.com/libsndfile/libsndfile
// commit: c7b69d7
// extract of: src/mat4.c (function: mat4_read_header)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);

typedef unsigned char byte;
typedef struct sf_private_tag {
  int64_t dataend;
  int64_t dataoffset;
  int bytewidth;
  byte *ptr;
} SF_PRIVATE;

/**
 * Just a utility function in test creation that generates random string of specified size that is not zero terminated
 */
char *getRandomStringNotZeroTerminated(int size) {
  char *randomString = (char*)calloc(size, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  return randomString;
}

static inline int32_t
psf_get_le32(const uint8_t *ptr, int offset) {
  int32_t value = ((uint32_t)ptr[offset + 3]) << 24;
  value += ptr[offset + 2] << 16;
  value += ptr[offset + 1] << 8;
  value += ptr[offset];
  return value;
}

void mat4_read_header(SF_PRIVATE *psf) {
  int rows = psf_get_le32(psf->ptr, psf->dataoffset);
  psf->dataoffset += 4;
  int cols = psf_get_le32(psf->ptr, psf->dataoffset);
  psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth; // Problem: integer overflow
  printf("%ld\n", psf->dataend);
}

int main() {
  SF_PRIVATE psf;
  psf.bytewidth = 8;
  psf.dataoffset = 0;
  // psf.ptr = calloc(8, sizeof(byte));
  // unsigned char byte_sequence[8] = {0xff, 0xff, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00};
  // memcpy(psf.ptr, byte_sequence, sizeof(byte_sequence));
  psf.ptr = (byte *)getRandomStringNotZeroTerminated(8);

  mat4_read_header(&psf);
  free(psf.ptr);
}
