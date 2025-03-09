// https://www.cvedetails.com/cve/CVE-2022-47089/
// repository: https://github.com/gpac/gpac
// commit: 15e3aec
// extract of: src/media_tools/av_parsers.c (function: gf_vvc_read_sps_bs_internal)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_STRING_LENGTH 64

typedef uint32_t u32;
typedef unsigned char byte;

int readUInt8(FILE *f) {
  int tmp_char = fgetc(f);
  if (tmp_char == EOF)
    exit(-1);
  return tmp_char;
}

u32 readUInt32(FILE *f) {
  return readUInt8(f) + (readUInt8(f) << 8) + (readUInt8(f) << 16) + (readUInt8(f) << 24);
}

int main() {
  FILE *f = fopen("gpac_7.hex", "r");
  if (f == NULL)
    return -1;

  byte rps[2][MAX_STRING_LENGTH];
  u32 sps_rpl1_same_as_rpl0 = readUInt8(f) ? 2 : 1;

  for (u32 i = 0; i < sps_rpl1_same_as_rpl0; i++) {
    u32 num_ref_pic_lists = readUInt32(f);
    u32 j;
    for (j = 0; j < num_ref_pic_lists; j++) {
      fread(&rps[i][j], sizeof(byte), 1, f); // Problem: j is read from file and it can be greater than 64. It would result in stack buffer overflow
    }
    if (j < MAX_STRING_LENGTH) {
      rps[i][j] = '\0';
    }
    printf("%s\n", rps[i]);
  }
  fclose(f);
}
