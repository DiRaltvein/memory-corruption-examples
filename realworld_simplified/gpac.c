// https://www.cvedetails.com/cve/CVE-2022-4202/
// repository: https://github.com/gpac/gpac
// commit: faac2ce
// extract of: src/laser/lsr_dec.c (function: lsr_translate_coords)

#include <limits.h>
#include <stdint.h>

typedef int32_t s32;
typedef uint32_t u32;

s32 lsr_translate_coords(u32 val, u32 nb_bits) {
  if (!nb_bits)
    return 0;

  if (val >> (nb_bits - 1)) {
    return (s32)val - (1 << nb_bits); // Problem: if nb_bits is 31 then left shift of a number 1 will overflow to a negative number
  }
  return 0;
}

int main() {
  lsr_translate_coords(INT_MAX, 31);
}
