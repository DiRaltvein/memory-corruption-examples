// https://www.cvedetails.com/cve/CVE-2023-48014/
// repository: https://github.com/gpac/gpac
// commit: cd8a95c
// extract of: src/media_tools/av_parsers.c (function: hevc_parse_vps_extension)

#include <string.h>

extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

int main() {
  int num_scalability_types = getNumberInRange(0, 16);
  char dim_bit_offset[16];

  if (num_scalability_types >= 16) {
    num_scalability_types = 15;
  }

  dim_bit_offset[num_scalability_types] = 6;
}
