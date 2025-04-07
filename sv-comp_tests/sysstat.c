// https://www.cvedetails.com/cve/CVE-2023-33204/
// repository: https://github.com/sysstat/sysstat
// commit: c43167c
// extract of: sysstat/common.c (function: check_overflow)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern unsigned int __VERIFIER_nondet_uint(void);

#define UINT_MAX (__INT_MAX__ * 2U + 1U)

// check overflow function does not cover all edge cases and some values can still pass this function while overflowing 4 byte unsigned int type
int check_overflow(unsigned int val1, unsigned int val2, unsigned int val3) {
  if ((unsigned long long)val1 * (unsigned long long)val2 * (unsigned long long)val3 > UINT_MAX) { // Problem: due to integer overflow function may pass
    return 1;
  }
  return 0;
}

// Example of input that will overflow: 4294967195 4294967290 2849931574
int main() {
  unsigned int val1 = __VERIFIER_nondet_uint();
  unsigned int val2 = __VERIFIER_nondet_uint();
  unsigned int val3 = __VERIFIER_nondet_uint();

  if (check_overflow(val1, val2, val3)) {
    return 1;
  }

  unsigned int noOverflow = val1 * val2 * val3; // Problem: potential integer overflow

  printf("Apparently there is not unsigned integer overflow %u\n", noOverflow);
}
