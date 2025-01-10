// https://www.cvedetails.com/cve/CVE-2023-33204/
// repository: https://github.com/sysstat/sysstat
// commit: c43167c
// extract of: sysstat/common.c (function: check_overflow)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define UINT_MAX (__INT_MAX__ * 2U + 1U)

// check overflow function does not cover all edge cases and the hardcoded values still overflow and pass function validation
void check_overflow(unsigned int val1, unsigned int val2,
                    unsigned int val3) {
  if ((unsigned long long)val1 * (unsigned long long)val2 *
          (unsigned long long)val3 >
      UINT_MAX) {
    printf("Overflow detected\n");
    exit(1);
  }
}

int main() {
  unsigned int val1 = UINT_MAX - 100;
  unsigned int val2 = UINT_MAX - 5;
  unsigned int val3 = 2849931574;
  check_overflow(val1, val2, val3);
}
