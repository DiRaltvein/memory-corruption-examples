// https://www.cvedetails.com/cve/CVE-2023-47016/
// repository: https://github.com/radareorg/radare2
// commit: 386d948
// extract of: libr/bin/p/bin_xnu_kernelcache.c (function: process_constructors)

#include <stdint.h>
#include <stdlib.h>

#define UT32_MAX 0xFFFFFFFFU

uint32_t r_read_le32(const void *src) {
  if (!src) {
    return UT32_MAX;
  }
  const uint8_t *s = (const uint8_t *)src;
  return (((uint32_t)s[3]) << 24) | (((uint32_t)s[2]) << 16) |
         (((uint32_t)s[1]) << 8) | (((uint32_t)s[0]) << 0);
}

uint32_t r_read_at_le32(const void *src, size_t offset) {
  if (!src) {
    return UT32_MAX;
  }
  const uint8_t *s = (const uint8_t *)src + offset;
  return r_read_le32(s);
}

uint64_t r_read_le64(const void *src) {
  uint64_t val = ((uint64_t)(r_read_at_le32(src, sizeof(uint32_t)))) << 32;
  val |= r_read_le32(src);
  return val;
}

int main(int argc, char *argv[]) {
  uint8_t *buf = calloc(argc, 1);
  int j;
  for (j = 0; j + 8 < argc; j += 8) {
    r_read_le64(buf + j);
  }
  free(buf);
}
