// https://www.cvedetails.com/cve/CVE-2021-32846/
// repository: https://github.com/moby/hyperkit
// commit: 41272a9
// extract of: src/lib/pci_virtio_sock.c (function: iovec_pull)

#include <stdlib.h>

extern int __VERIFIER_nondet_int(void);

struct iovec {
  int iov_len;
};

int vq_getchain(struct iovec *iov) {
  int i = 0;
  for (; i < 32; i++) {
    int iov_len = __VERIFIER_nondet_int();
    if (iov_len == 9) {
      return -1;
    }
    iov[i].iov_len = iov_len;
  }
  return i;
}

void iovec_pull(struct iovec **iov, int iov_len, int *result) {
  *result = 0;
  while (iov_len) {
    *result += (*iov)[0].iov_len;
    iov_len--;
    (*iov)++;
  }
}

int main() {
  int iov_len, result;
  struct iovec iov_array[32];
  struct iovec *iov = iov_array;
  iov_len = vq_getchain(iov);
  if (iov_len < 0) {
    return 0;
  }
  iovec_pull(&iov, iov_len, &result);
}
