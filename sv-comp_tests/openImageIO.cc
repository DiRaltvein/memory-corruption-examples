// https://www.cvedetails.com/cve/CVE-2023-36183/
// repository: https://github.com/AcademySoftwareFoundation/OpenImageIO
// commit: 1cd0d0a
// extract of: src/ico.imageio/icoinput.cpp (function: readimg)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

struct ico_palette_entry {
  int8_t b, g, r;
  int8_t reserved; // unused
};

int read_c(void *buf, size_t itemsize, size_t nitems, FILE *file) {
  size_t n = fread(buf, itemsize, nitems, file);
  if (n != nitems) {
    return 0;
  }
  return 1;
}

// simplified example of reading a DIB (Device-Independent Bitmap) file of size 3x3
// first 4 bytes show number of collor pallets present
// each color pallet is like in actual DIB and consists of 4 bytes where first 3 bytes are RED GREEN BLUE and last one is reserved and not used
// after color pallets goes actual image bytes, where each image bit is represented by 1 byte
// each byte is just an index of collor pallet. For example is first collor pallet is FF 00 00 00 (red) and the bit byte representation is 00 then this bit references first color pallet and it is red
int main() {
  FILE *file = fopen("openImageIO.hex", "rb");
  if (file == NULL) {
    return 1;
  }
  int m_palette_size;
  read_c(&m_palette_size, 1, sizeof(m_palette_size), file);

  std::vector<ico_palette_entry> palette(m_palette_size);
  std::vector<unsigned char> m_buf(3 * 3 * 3);

  for (int i = 0; i < m_palette_size; i++) {
    if (!read_c(&palette[i], 1, sizeof(ico_palette_entry), file)) {
      fclose(file);
      return 1;
    }
  }

  std::vector<unsigned char> scanline(3);
  ico_palette_entry *pe;
  int k = 0;
  for (int y = 0; y < 3; y++) {
    if (!read_c(&scanline[0], 1, 3, file)) {
      fclose(file);
      return 1;
    }
    for (int x = 0; x < 3; x++) {
      pe = &palette[scanline[x]]; // Problem: code assumes that each picture bit representing byte is at most len(palette) - 1. If image bit is greater than length of color pallet buffer overflow will happen
      m_buf[k++] = pe->r;
      m_buf[k++] = pe->g;
      m_buf[k++] = pe->b;
    }
  }
  fclose(file);
}
