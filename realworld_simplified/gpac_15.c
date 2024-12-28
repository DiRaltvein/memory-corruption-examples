// https://www.cvedetails.com/cve/CVE-2022-47660/
// repository: https://github.com/gpac/gpac
// commit: 55c8b3a
// extract of: src/isomedia/isom_write.c (function: gf_isom_shift_cts_offset)

#include <limits.h>
#include <stdint.h>
#include <stdio.h>

#define ENTRIES_LENGTH 5

typedef struct
{
  int32_t decodingOffset;
} GF_DttsEntry;

void gf_isom_shift_cts_offset(GF_DttsEntry *entries, int nb_entries, int32_t offset_shift) {
  for (int i = 0; i < nb_entries; i++) {
    entries[i].decodingOffset -= offset_shift; // Problem: integer overflow
    printf("Decoding offset: %d\n", entries[i].decodingOffset);
  }
}

int main() {
  GF_DttsEntry entries[ENTRIES_LENGTH];
  entries[0].decodingOffset = 1;
  entries[1].decodingOffset = 5;
  entries[2].decodingOffset = 213;
  entries[3].decodingOffset = 23;
  entries[4].decodingOffset = 1852736474;
  int32_t offset_shift = -1953749291;

  gf_isom_shift_cts_offset(entries, ENTRIES_LENGTH, offset_shift);
}