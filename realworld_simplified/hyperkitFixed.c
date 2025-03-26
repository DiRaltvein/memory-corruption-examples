// https://www.cvedetails.com/cve/CVE-2021-32845/
// repository: https://github.com/moby/hyperkit
// commit: 451558f
// extract of: src/lib/pci_virtio_rnd.c (function: pci_vtrnd_notify)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

struct iovec {
  uint32_t *iov_base;
  int iov_len;
};

int vq_getchain(struct iovec *iov) {
  if (iov->iov_len & 0x10) {
    return -1;
  }

  iov->iov_base = calloc(iov->iov_len, sizeof(uint32_t));
  if (iov->iov_base == NULL) {
    return -1;
  }
  iov->iov_base[0] = 0;
  iov->iov_base[1] = 1;
  return 0;
}

int main(int argc, char *argv[]) {
  if (argc > 28 || argc < 0) {
    return 1;
  }
  struct iovec iov= {0};
  iov.iov_len = argc + 2;

  if (vq_getchain(&iov) == - 1) {
    return 1;
  }

  for (int i = 2; i < iov.iov_len; i++) {
    iov.iov_base[i] = iov.iov_base[i - 1] + iov.iov_base[i - 2];
  }

  int sum = 0;
  for (int i = 0; i < iov.iov_len; i++) {
    sum += iov.iov_base[i];
  }
  printf("Sum of fibonachi sequence of length %d: %d\n", iov.iov_len, sum);

  if (iov.iov_base != NULL) {
    free(iov.iov_base);
  }
}
