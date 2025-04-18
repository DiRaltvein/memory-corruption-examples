// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-44709/
// repository: https://github.com/sammycage/plutovg
// commit: 30ccd4d
// extract of: source/plutovg.c (function: plutovg_surface_create)

#include <stdio.h>
#include <stdlib.h>
#include "helpers.c"

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

int main() {
  plutovg_surface_t *surface = plutovg_surface_create(__VERIFIER_nondet_int(), __VERIFIER_nondet_int());
  if (surface == NULL) {
    return 1;
  }

  free(surface->data);
  free(surface);
}
