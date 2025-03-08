// https://www.cvedetails.com/cve/CVE-2024-0321/
// repository: https://github.com/gpac/gpac
// commit: 7460cb3
// extract of: src/filters/load_text.c (function: gf_text_get_u8_line)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;
typedef uint8_t u8;

// Problem: because szLineConv has a fixed length big szLine can cause a stack buffer overflow
// this problem can happen in multiple places such as line number 25, 30, 34, 35, 39, 40, 41, 47, 49
void gf_text_get_UTF8_line(char *szLine) {
  char szLineConv[34];

  u32 j = 0;
  u32 len = (u32)strlen(szLine);
  for (u32 i = 0; i < len; i++) {
    if ((szLine[i] & 0x80)) {
      /*non u8 (likely some win-CP)*/
      if ((szLine[i + 1] & 0xc0) != 0x80) {
        szLineConv[j++] = 0xc0 | ((szLine[i] >> 6) & 0x3);
        szLine[i] &= 0xbf;
      }
      /*u8 2 bytes char*/
      else if ((szLine[i] & 0xe0) == 0xc0) {
        szLineConv[j++] = szLine[i++];
      }
      /*u8 3 bytes char*/
      else if ((szLine[i] & 0xf0) == 0xe0) {
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
      }
      /*u8 4 bytes char*/
      else if ((szLine[i] & 0xf8) == 0xf0) {
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
      } else {
        i += 1;
        continue;
      }
    }
    szLineConv[j++] = szLine[i];
  }
  szLineConv[j] = 0;
  strcpy(szLine, szLineConv);
}

int main() {
  char line[] = {
      0xC2, 0x41,
      0xC2, 0x41,
      0xC2, 0x41,
      0xC2, 0x41,
      0xC2, 0x41,
      0xC2, 0x41,
      0xC2, 0x41,
      0xE2, 0x82, 0xAC,
      0xf0, 0x9f, 0x98, 0x85,
      0xf0, 0x9f, 0x98, 0x85,
      0xf0, 0x9f, 0x9a, 0x80,
      0xf0, 0x9f, 0x9a, 0x80,
      0x00};

  gf_text_get_UTF8_line(line);

  printf("%s\n", line);
}
