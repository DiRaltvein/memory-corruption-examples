// https://www.cvedetails.com/cve/CVE-2024-0321/
// repository: https://github.com/gpac/gpac
// commit: d2de8b5
// extract of: src/filters/load_text.c (function: gf_text_get_utf8_line)

#include <stdint.h>
#include <string.h>

void gf_text_get_utf8_line(char *szLine) {
  char szLineConv[2048];
  memset(szLineConv, 65, 1500);
  strcpy(szLine, szLineConv); // Problem: trying to copy 2048 bytes into buffer with length of 1024.
}

int main() {
  char szLine[1024];
  gf_text_get_utf8_line(szLine);
}
