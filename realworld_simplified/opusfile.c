// https://www.cvedetails.com/cve/CVE-2022-47021/
// repository: https://github.com/xiph/opusfile
// commit: cf218fb
// extract of: src/opusfile.c (function: op_open1)

#include <stdlib.h>
#include <string.h>

char *ogg_sync_buffer(size_t size) {
  char *buffer = malloc(size * sizeof(char) + 4096);
  if (!buffer) {
    return NULL;
  }
  return buffer;
}

int main(int argc, char *argv[]) {
  char *buffer;
  size_t size = sizeof(argv[0]);
  buffer = ogg_sync_buffer(size);
  memcpy(buffer, argv[0], size); // Problem: buffer can be potentially NULL
  free(buffer);
}
