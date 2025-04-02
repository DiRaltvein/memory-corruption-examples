// https://www.cvedetails.com/cve/CVE-2023-41101/
// repository: https://github.com/openNDS/openNDS
// commit: 5e04ea1
// extract of: src/http_microhttpd.c (function: get_query)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define QUERYMAXLEN 80

/**
 * Elements are query key value pairs. Example: foo=bar
 * element_counter shows how many elements is inside elements array or eg many query key value pairs there is
 */
static int get_query(char **elements, int element_counter, char *query, const char separator) {
  char *query_str; // temp variable where query is temporarly saved
  int i;
  int length = 1; // total length of the final query (including first '?' symbol)

  for (i = 0; i < element_counter; i++) {
    if (!elements[i])
      continue;
    length += strlen(elements[i]);

    if (i > 0) // q=foo&o=bar the '&' need also some space
      length++;
  }

  query_str = (char *)calloc(QUERYMAXLEN, sizeof(char));

  for (i = 0; i < element_counter; i++) {
    if (!elements[i]) {
      continue;
    }

    if (length < QUERYMAXLEN) {

      strncpy(query, elements[i], length);

      if (i == 0) {
        // query_str is empty when i = 0 so safe to copy a single char into it
        strcpy(query_str, "?");
      } else {
        if (QUERYMAXLEN - strlen(query_str) > 1) {
          strncat(query_str, &separator, 1);
        }
      }

      strncat(query_str, query, QUERYMAXLEN - strlen(query_str));
    } else {
      printf("Query string is too long, invalid or corrupt so is ignored.\n");
    }

    free(elements[i]);
  }

  strncpy(query, query_str, QUERYMAXLEN);
  query[QUERYMAXLEN - 1] = '\0';
  free(query_str);
  free(elements);
  return 0;
}

int main() {
  char query[QUERYMAXLEN] = {0};
  char **elements = (char **)malloc(4 * sizeof(char *));
  elements[0] = strdup("key=value");
  elements[1] = strdup("hello=there");
  elements[2] = strdup("this=is");
  elements[3] = strdup("LICENSE_KEY=ABCD-EFGH-IJKL-MNOP-QRST-UVWX-YZ12-3");

  get_query((char **)elements, 4, (char *)query, '&');
  printf("%s\n", query);
}
