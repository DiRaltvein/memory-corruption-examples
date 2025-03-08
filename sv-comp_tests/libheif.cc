// https://www.cvedetails.com/cve/CVE-2023-0996/
// repository: https://github.com/strukturag/libheif
// commit: f61fe73
// extract of: libheif/heif_emscripten.h (function: strided_copy)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void strided_copy(void *dest, const void *src, int row_width, int number_of_rows, int stride) {
  if (row_width == stride) {
    memcpy(dest, src, row_width * number_of_rows);
  } else {
    const uint8_t *_src = static_cast<const uint8_t *>(src);
    uint8_t *_dest = static_cast<uint8_t *>(dest);
    for (int y = 0; y < number_of_rows; y++, _dest += row_width, _src += stride) {
      // Problem: destination buffer assumes that only valid data is copied into it but because more data is copied into it dest buffer overflows
      memcpy(_dest, _src, stride);
    }
  }
}

int main() {
  char *dest = (char *)calloc(13, sizeof(char));
  if (dest == NULL) {
    return 1;
  }

  char src[] = {'h', 'e', 'l', 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                'l', 'o', ' ', 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                'w', 'o', 'r', 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                'l', 'd', '!', 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

  // function is expected to copy only 'row_width' bytes from src byffer into destination buffer and skip all padding bytes
  // in the end dest buffer should contain "hello world!"
  strided_copy(dest, src, 3, 4, 10);

  printf("%s\n", dest);
  free(dest);
}
