// https://www.cvedetails.com/cve/CVE-2022-47095/
// repository: https://github.com/gpac/gpac
// commit: 6ddedfb
// extract of: src/media_tools/av_parsers.c (function: hevc_parse_vps_extension)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;

int main() {
  uint8_t splitting_flag = 1;
  u32 i, num_scalability_types, sum;
  char scalability_mask[] = "abcdef@#@!_A)#($!#@'\'\"QW)0";
  u32 dimension_id_len[16];

  num_scalability_types = 0;
  for (i = 0; i < strlen((char*)scalability_mask); i++) {
    num_scalability_types += atoi(&scalability_mask[i]);
  }
  if (num_scalability_types >= 16) {
    num_scalability_types = 15;
  }
  dimension_id_len[0] = 0;
  sum = 0;
  for (i = 0; i < (num_scalability_types - splitting_flag); i++) { // Problem: operation 0 - 1 overflows and because type is unsigned integer the number becomes very big
    dimension_id_len[i] = i;                                       // Problem: Because of number overflow dimension_id_len buffer overflows.
    sum += dimension_id_len[i];
  }
  printf("%u\n", sum); // used to mainly silence unused warnings
}
