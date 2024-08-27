// https://www.cvedetails.com/cve/CVE-2023-36239/
// repository: https://github.com/libming/libming
// commit: 5aa3470
// extract of: util/parser.c (function: parseSWF_DEFINEFONTINFO)

#include <stdio.h>
#include <stdlib.h>

typedef unsigned short UI16;

int readUInt8(FILE *f) {
  int tmp_char = fgetc(f);
  if (tmp_char == EOF)
    exit(-1);
  return tmp_char;
}

unsigned long readUInt32(FILE *f) {
  return (unsigned long)(readUInt8(f) + (readUInt8(f) << 8) + (readUInt8(f) << 16) + (readUInt8(f) << 24));
}

int main(int argc, char *argv[]) {
  FILE *f = fopen("libming.hex", "r");
  if (f == NULL)
    return -1;
  int length = readUInt32(f);

  UI16 *data = (UI16 *)malloc(length * sizeof(UI16)); // Problem: length read from file may be bigger then allowed allocation size

  free(data);
  fclose(f);
}
