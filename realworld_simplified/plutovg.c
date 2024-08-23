// https://www.cvedetails.com/cve/CVE-2023-44709/
// repository: https://github.com/sammycage/plutovg
// commit: 30ccd4d
// extract of: source/plutovg.c (function: plutovg_surface_create)

#include <stdlib.h>

int main(int argc, char *argv[]) {
  int width = 23171;
  void *p = calloc(1, (size_t)(width * width * 4)); // Problem: integer overflow
  free(p);
}
