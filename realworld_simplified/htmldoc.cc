// https://www.cvedetails.com/cve/CVE-2021-34119/
// repository: https://github.com/michaelrsweet/htmldoc
// commit: ee77825
// extract of: htmldoc/ps-pdf.cxx (function: parse_paragraph)

#include <stdio.h> // printf
#include <string.h>

typedef enum {
  MARKUP_NONE = 0,
  MARKUP_BODY = 1,
} markup_t;

typedef struct tree_str {
  markup_t markup; /* Markup code */
  char *data;      /* Text (MARKUP_NONE or MARKUP_COMMENT) */
} tree_t;

void parse_paragraph(tree_t *t, int size) {
  for (int i = 0; i < size; i++) {
    if (t[i].markup == MARKUP_NONE) {
      int ch = t[i].data[strlen((char *)t[i].data) - 1]; // Problem: tree_str.data is not initialized

      if (ch == 173)
        break;
    }
  }
}

int main(int argc, char *argv[]) {
  int size = 10;
  tree_t document[10];
  for (int i = 0; i < size; i++) {
    document[i].markup = MARKUP_NONE;
  }
  parse_paragraph(document, size);
}
