// https://www.cvedetails.com/cve/CVE-2021-33304/
// repository: https://github.com/virtualsquare/picotcp
// commit: f336ead
// extract of: modules/pico_fragments.c (function: pico_fragments_reassemble)

#include <stdlib.h>

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

struct pico_frame {
  int someValue;
};

int pico_transport_receive(struct pico_frame *full, int proto) {
  int ret;
  switch (proto) {
  case 0:
    ret = 99;
    break;
  case 99:
    ret = 0;
    break;
  default:
    free(full);
    ret = -1;
  }
  return ret;
}

int main() {
  struct pico_frame *full = (struct pico_frame *)malloc(sizeof(struct pico_frame));
  if (pico_transport_receive(full, getNumberInRange(0, 100)) == -1) {
    free(full); // Problem: double free because if pico_transport_receive returns -1 full pointer is freed inside it
  }
  if (full != NULL) {
    free(full);
  }
}
