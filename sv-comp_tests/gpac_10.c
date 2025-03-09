// https://www.cvedetails.com/cve/CVE-2022-47653/
// repository: https://github.com/gpac/gpac
// commit: 007bf61
// extract of: src/media_tools/av_parsers.c (function: eac3_update_channels)

#include <stdint.h>
#include <string.h>

extern int __VERIFIER_nondet_int(void);

typedef struct {
  uint32_t acmod;
} GF_AC3StreamInfo;

typedef struct {
  uint32_t nb_streams;
  GF_AC3StreamInfo streams[8];
} GF_AC3Config;

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
  GF_AC3Config hdr;
  hdr.nb_streams = getNumberInRange(0, 20);
  for (uint32_t i = 0; i < hdr.nb_streams; i++) {
    hdr.streams[i].acmod = i; // Problem: hdr.nb_streams is 10 but hdr.streams length is only 8 that results in stack buffer overflow
  }
}
