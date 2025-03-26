// https://www.cvedetails.com/cve/CVE-2023-0341/
// repository: https://github.com/editorconfig/editorconfig-core-c
// commit: 412225d
// extract of: src/lib/ec_glob.c (function: ec_glob)

#include <stdio.h>
#include <string.h>

/* concatenate the string then move the pointer to the end */
#define STRING_CAT(p, string, end)      \
  do {                                  \
    size_t string_len = strlen(string); \
    if (p + string_len >= end)          \
      return -1;                        \
    strcat(p, string);                  \
    p += string_len;                    \
  } while (0)

#define ADD_CHAR(string, new_chr, end) \
  do {                                 \
    if (string + 1 >= end)             \
      return -1;                       \
    *(string++) = new_chr;             \
  } while (0)

#define PATTERN_MAX 40

int ec_glob(char *pattern) {
  char *c;
  char pcre_str[2 * PATTERN_MAX] = "^";
  char *p_pcre;
  char *pcre_str_end;

  p_pcre = pcre_str + 1;
  pcre_str_end = pcre_str + 2 * PATTERN_MAX;

  for (c = pattern; *c; ++c) {
    switch (*c) {
    case '?':
      STRING_CAT(p_pcre, "[^/]", pcre_str_end);
      break;
    default:
      ADD_CHAR(p_pcre, *c, pcre_str_end);
    }
  }

  printf("pcre_str: %s\n", pcre_str);

  return 0;
}

int main() {
  return ec_glob("???????????????????aaaaaaaaaaa");
}
