// https://www.cvedetails.com/cve/CVE-2022-43634/
// repository: https://github.com/Netatalk/netatalk
// commit: 0637355
// extract of: libatalk/dsi/dsi_write.c (function: dsi_writeinit)

#include <stdlib.h>
#include <string.h>

#define BUF_LEN 5
#define MIN(a, b) ((a) < (b) ? (a) : (b))

typedef struct _ {
  char *start;
  char *eof;
  size_t datasize;
} DSI;

size_t dsi_writeinit(DSI *dsi, void *buf, const size_t buflen) {
  size_t bytes = 0;

  if (dsi->eof > dsi->start) {
    /* We have data in the buffer */
    bytes = MIN(dsi->eof - dsi->start, dsi->datasize);
    memmove(buf, dsi->start, bytes); // Problem: buf overflow if executable name is 5 or more characters
    dsi->start += bytes;
    dsi->datasize -= bytes;
    if (dsi->start >= dsi->eof)
      dsi->start = dsi->eof;
  }

  return bytes;
}

void initDsi(DSI *dsi, char *executableName) {
  dsi->start = executableName;
  dsi->datasize = strlen(executableName);
  dsi->eof = dsi->start + dsi->datasize;
}

int main(int argc, char *argv[]) {
  DSI dsi = {0};
  initDsi(&dsi, argv[0]);
  char buf[BUF_LEN];
  while (dsi.eof > dsi.start) {
    dsi_writeinit(&dsi, &buf, BUF_LEN);
  }
}
