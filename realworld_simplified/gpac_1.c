// https://www.cvedetails.com/cve/CVE-2024-0321/
// repository: https://github.com/gpac/gpac
// commit: d2de8b5
// extract of: src/filters/load_text.c (function: gf_text_get_UTF8_line)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;
typedef uint8_t u8;

#define GF_ARRAY_LENGTH(a) (sizeof(a) / sizeof((a)[0]))

// initial function as also modified and i constraints have been added to only leave 1 vulnerability on line 69
void gf_text_get_UTF8_line(char *szLine) {
  char szLineConv[2048] = {0};

  u32 j = 0;
  u32 len = (u32)strlen(szLine);

  if (len == 0) {
    return;
  }

  for (u32 i = 0; i < len; i++) {
    if ((szLine[i] & 0x80)) {
      /*non u8 (likely some win-CP)*/
      if (i + 1 < len && (szLine[i + 1] & 0xc0) != 0x80) {
        if (j >= GF_ARRAY_LENGTH(szLineConv))
          break;
        szLineConv[j++] = 0xc0 | ((szLine[i] >> 6) & 0x3);
        szLine[i] &= 0xbf;
      }
      /*u8 2 bytes char*/
      else if ((szLine[i] & 0xe0) == 0xc0) {
        if (j >= GF_ARRAY_LENGTH(szLineConv) || i >= len)
          break;
        szLineConv[j++] = szLine[i++];
      }
      /*u8 3 bytes char*/
      else if ((szLine[i] & 0xf0) == 0xe0) {
        if (j + 1 >= GF_ARRAY_LENGTH(szLineConv) || i + 1 >= len)
          break;
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
      }
      /*u8 4 bytes char*/
      else if ((szLine[i] & 0xf8) == 0xf0) {
        if (j + 2 >= GF_ARRAY_LENGTH(szLineConv) || i + 2 >= len)
          break;
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
        szLineConv[j++] = szLine[i++];
      } else {
        i += 1;
        continue;
      }
    }

    if (j >= GF_ARRAY_LENGTH(szLineConv) || i >= len)
      break;

    szLineConv[j++] = szLine[i];
  }

  if (j >= GF_ARRAY_LENGTH(szLineConv)) {
    printf("Line too long to convert to utf8 (len: %u)\n", len);
    j = GF_ARRAY_LENGTH(szLineConv) - 1;
  }

  szLineConv[j] = 0;
  strcpy(szLine, szLineConv); // Problem: szLineConv length is greater than length of szLine that causes a stack buffer overflow
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
