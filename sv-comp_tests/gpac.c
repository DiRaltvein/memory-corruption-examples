// https://www.cvedetails.com/cve/CVE-2022-4202/
// repository: https://github.com/gpac/gpac
// commit: faac2ce
// extract of: src/laser/lsr_dec.c (function: lsr_translate_coords)

// Similar vulnerability:
// - https://www.cvedetails.com/cve/CVE-2022-47092/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

extern int __VERIFIER_nondet_int(void);

typedef int32_t s32;
typedef uint32_t u32;

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

s32 lsr_translate_coords(s32 val, u32 nb_bits) {
  if (!nb_bits)
    return 0;

  if (val >> (nb_bits - 1)) {
    return (s32)val - (1 << nb_bits); // Problem: left shift of 1 by 31 places cannot be represented in type 'int'. Signed number will overflow leading to 'undefined behaviour' as per C standard
  }
  return 0;
}

// to cause an undefined behaviour value 2147483647 and 31 can be passed and number1 and number2 respectively
int main() {
  printf("Translated number: %d\n", lsr_translate_coords(__VERIFIER_nondet_int(), getNumberInRange(0, 31)));
}
