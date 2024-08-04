// https://www.cvedetails.com/cve/CVE-2021-32845/
// repository: https://github.com/moby/hyperkit
// commit: 451558f
// extract of: src/lib/pci_virtio_rnd.c (function: pci_vtrnd_notify)

#include <fcntl.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

struct iovec {
  void *iov_base;
  size_t iov_len;
};

int vq_getchain(struct iovec *iov) {
  // Random reason why function may exit early
  time_t now = time(NULL);
  struct tm *tm = localtime(&now);

  if (tm->tm_hour > 5) {
    return -1; // In case it is 6 hours or more do not initialze iov struct
  }
  //

  iov->iov_base = calloc(10, sizeof(char));
  iov->iov_len = 10;

  return 0;
}

int main(int argc, char *argv[]) {
  struct iovec iov;

  int file = open("text.txt", O_RDONLY);
  if (file < 0) {
    return 1;
  }

  vq_getchain(&iov); // in case this function 'fails' for any reason iov struct will not be initialized and its further use is danherous

  read(file, iov.iov_base, iov.iov_len); // Problem: trying to read contents of a file using buffer and length from potentially uninitialized struct

  if (iov.iov_base != NULL) {
    free(iov.iov_base);
  }
}
