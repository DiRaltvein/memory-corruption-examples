// https://www.cvedetails.com/cve/CVE-2023-36272/
// repository: https://github.com/LibreDWG/libredwg
// commit: 77a8562
// extract of: src/bits.c (function: bit_utf8_to_TU)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

uint16_t *bit_utf8_to_TU(char *restrict str) {
  uint16_t *wstr;
  size_t i = 0;
  size_t len = strlen(str);
  unsigned char c;

  if (len > 0xFFFE) {
    printf("Overlong string truncated (len=%lu)\n", (unsigned long)len);
    len = UINT16_MAX - 1;
  }
  wstr = (uint16_t *)calloc(2, len + 1);
  if (!wstr) {
    printf("Out of memory\n");
    return NULL;
  }
  while (len > 0 && (c = *str++)) {
    len--;
    if (c < 128) {
      wstr[i++] = c;
    } else if ((c & 0xe0) == 0xc0) {
      /* ignore invalid utf8 for now */
      if (len >= 1) {
        wstr[i++] = ((c & 0x1f) << 6) | (str[1] & 0x3f);
        len--;
        str++;
      }
    } else if ((c & 0xf0) == 0xe0) {
      /* ignore invalid utf8? */
      if (len >= 2 && ((unsigned char)str[1] < 0x80 || (unsigned char)str[1] > 0xBF || (unsigned char)str[2] < 0x80 || (unsigned char)str[2] > 0xBF)) {
        printf("utf-8: BAD_CONTINUATION_BYTE %s\n", str);
      } else if (len >= 1 && c == 0xe0 && (unsigned char)str[1] < 0xa0) {
        printf("utf-8: NON_SHORTEST %s\n", str);
      } else if (len >= 2) {
        wstr[i++] = ((c & 0x0f) << 12) | ((str[1] & 0x3f) << 6) | (str[2] & 0x3f);
        str++;
        str++;
        len--;
        len--;
      }
    }
    /* everything above 0xf0 exceeds ucs-2, 4-6 byte seqs */
  }
  return wstr;
}

int main() {
  char test_str[] = "=~[\xB4\xE8";
  uint16_t *converted = bit_utf8_to_TU(test_str);
  if (converted) {
    printf("String converted\n");
    free(converted);
  } else {
    printf("Conversion failed\n");
  }
}
