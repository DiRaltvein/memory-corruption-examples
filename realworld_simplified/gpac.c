// https://www.cvedetails.com/cve/CVE-2022-4202/
// repository: https://github.com/gpac/gpac
// commit: faac2ce
// extract of: src/laser/lsr_dec.c (function: lsr_translate_coords)

// Similar vulnerability:
// - https://www.cvedetails.com/cve/CVE-2022-47092/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int32_t s32;
typedef uint32_t u32;

s32 lsr_translate_coords(s32 val, u32 nb_bits) {
  if (!nb_bits)
    return 0;

  if (val >> (nb_bits - 1)) {
    return (s32)val - (1 << nb_bits); // Problem: left shift of 1 by 31 places cannot be represented in type 'int'. Signed number will overflow leading to 'undefined behaviour' as per C standard
  }
  return 0;
}

int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Provide 2 parameters\n");
    exit(1);
  }
  u32 val = atoi(argv[1]);     // 2147483647
  u32 nb_bits = atoi(argv[2]); // 31
  s32 result = lsr_translate_coords(val, nb_bits);
  printf("Translated number: %d\n", result);
}
