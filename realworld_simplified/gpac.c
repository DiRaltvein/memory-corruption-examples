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
    return (s32)val - (1 << nb_bits); // Problem: left shift of 1 by 31 places cannot be represented in type 'int'
  }
  return 0;
}

// to cause an undefined behaviour value 2147483647 and 31 can be passed and number1 and number2 respectively
int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Usage: %s <number1> <number2>\n", argv[0]);
    return 1;
  }

  printf("Translated number: %d\n", lsr_translate_coords(atoi(argv[1]), atoi(argv[2])));
}
