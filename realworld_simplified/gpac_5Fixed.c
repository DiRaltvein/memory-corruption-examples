// https://www.cvedetails.com/cve/CVE-2023-48014/
// repository: https://github.com/gpac/gpac
// commit: cd8a95c
// extract of: src/media_tools/av_parsers.c (function: hevc_parse_vps_extension)

#include <string.h>

int main(int argc, char *argv[]) {
  int num_scalability_types = argc;
  char dim_bit_offset[16];

  if (num_scalability_types >= 16) {
    num_scalability_types = 15;
  }

  dim_bit_offset[num_scalability_types] = 6;
}
