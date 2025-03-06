// https://www.cvedetails.com/cve/CVE-2021-32292/
// repository: https://github.com/json-c/json-c
// commit: 56a89f9
// extract of: apps/json_parse.c (function: parseit)

#include <assert.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define PEEK_CHAR(dest, tok)   \
  (((tok)->char_offset == len) \
       ? 0                     \
       : (((dest) = *str), 1))

#define ADVANCE_CHAR(str, tok) (++(str), ((tok)->char_offset)++, c)

typedef struct {
  int char_offset;
} json_tokener;

int json_tokener_parse_ex(json_tokener *tok, char *str, int len) {
  char c = '\1';

  tok->char_offset = 0;

  if ((len < -1) || (len == -1 && strlen(str) > INT32_MAX)) {
    return 1;
  }

  while (PEEK_CHAR(c, tok)) {
    if (c == '\"') {
      if (!ADVANCE_CHAR(str, tok) || !PEEK_CHAR(c, tok)) {
        return 1;
      }
      char *strStart = str;

      while (c != '\"') {
        if (!ADVANCE_CHAR(str, tok) || !PEEK_CHAR(c, tok)) {
          return 1;
        }
      }

      *str = '\0';
      printf("Found string: %s\n", strStart);

    } else if (c >= '0' && c <= '9') {
      int num = 0;

      while (c >= '0' && c <= '9' && num < INT_MAX / 10 - 10) {
        num = num * 10 + (c - '0');

        if (!ADVANCE_CHAR(str, tok) || !PEEK_CHAR(c, tok)) {
          return 1;
        }
      }

      printf("Found number: %d\n", num);
    } else {
      printf("character skipped: %c\n", c);
    }
    (void)ADVANCE_CHAR(str, tok);
    if (!c) {
      break;
    }
  }

  return 0;
}

int parseit(FILE *fd) {
  char buf[50];
  int ret;
  json_tokener tok = {0};

  size_t total_read = 0;
  while ((ret = fread(buf, sizeof(char), sizeof(buf), fd)) > 0) {
    total_read += ret;
    int start_pos = 0;
    while (start_pos != ret) {
      int error = json_tokener_parse_ex(&tok, &buf[start_pos], ret - start_pos); // tok char_offset should be greater than ret for buf to overflow
      int parse_end = tok.char_offset;
      if (error) {
        char *aterr = &buf[start_pos + parse_end]; // Problem: aterr is pointing out of bound of buf buffer, because start_pos + parse_end may equal length of buffer
        int fail_offset = total_read - ret + start_pos + parse_end;
        printf("Failed at offset %d: %c\n", fail_offset, aterr[0]); // Problem: stack buffer overflow of aterr
        return 1;
      }
      start_pos += parse_end;
      assert(start_pos <= ret);
    }
  }
  return 0;
}

int main() {
  FILE *fd = fopen("json-c.hex", "r");
  if (fd == NULL) {
    printf("Could not open file\n");
    exit(1);
  }

  int ret = parseit(fd);
  fclose(fd);

  return ret;
}
