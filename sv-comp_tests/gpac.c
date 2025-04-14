// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2022-4202/
// repository: https://github.com/gpac/gpac
// commit: faac2ce
// extract of: src/laser/lsr_dec.c (function: lsr_translate_coords)

// Similar vulnerability:
// - https://www.cvedetails.com/cve/CVE-2022-47092/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "helpers.c"

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

// to cause an undefined behaviour value 2147483647 and 31 can be passed as number1 and number2 respectively
int main() {
  printf("Translated number: %d\n", lsr_translate_coords(__VERIFIER_nondet_int(), getNumberInRange(0, 31)));
}
