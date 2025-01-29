// https://www.cvedetails.com/cve/CVE-2023-39125/
// repository: https://github.com/LMP88959/NTSC-CRT
// commit: 4dd4272
// extract of: bmp_rw.c (function: loadBMP)

// Similar issues:
// - CVE-2023-42295

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HEADER_SIZE 8

int main() {
  FILE *f;
  unsigned char header[54];
  unsigned char pad[3];
  unsigned char *data = NULL;
  unsigned int width, height, size;
  unsigned char BPP, padding;
  unsigned int X;
  int Y;

  f = fopen("NTSC-CRT.bmp", "rb");
  if (f == NULL) {
    return 1;
  }
  fread(header, sizeof(unsigned char), 54, f);
  width = *(int *)&header[18];
  height = *(int *)&header[22];
  BPP = *(int *)&header[28];
  size = (width * height * (BPP / 8)); // Problem: integer overflow
  padding = ((4 - (width * (BPP / 8)) % 4) % 4);
  data = calloc(size, (BPP / 8));
  if (data == NULL) {
    fclose(f);
    return 1;
  }
  fseek(f, 54, SEEK_SET);
  for (Y = height - 1; Y >= 0; Y--) {
    for (X = 0; X < width; X++) {
      fread(&data[(Y * width + X) * (BPP / 8)], (BPP / 8), 1, f); // Problem: write out of bound due to integer overflow earlier
    }
    fread(pad, padding, 1, f);
  }
  fclose(f);
  free(data);
}
