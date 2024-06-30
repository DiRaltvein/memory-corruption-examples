// https://www.cvedetails.com/cve/CVE-2021-33304/
// repository: https://github.com/virtualsquare/picotcp
// commit: f336ead
// extract of: modules/pico_fragments.c (function: pico_fragments_reassemble)

#include <stdlib.h>

struct pico_frame {
  int someValue;
};

int pico_transport_receive(struct pico_frame *full, int proto) {
  int ret = -1;
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

int main(int argc, char *argv[]) {
  struct pico_frame *full = (struct pico_frame *)malloc(sizeof(struct pico_frame));
  if (pico_transport_receive(full, argc) == -1) {
    free(full);
  }
  if (full != NULL) {
    free(full);
  }
}
