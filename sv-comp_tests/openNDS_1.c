// https://www.cvedetails.com/cve/CVE-2023-41101/
// repository: https://github.com/openNDS/openNDS
// commit: 5e04ea1
// extract of: src/http_microhttpd.c (function: get_query)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

#define QUERYMAXLEN 80

/**
 * Elements are query key value pairs. Example: foo=bar
 * element_counter shows how many elements is inside elements array or eg many query key value pairs there is
 */
static int get_query(char **elements, int element_counter, char *query, const char separator) {
  char *query_str; // temp variable where query is temporarly saved
  int i;
  int length = 0; // total length of the final query

  for (i = 0; i < element_counter; i++) {
    if (!elements[i])
      continue;
    length += strlen(elements[i]);

    if (i > 0) // q=foo&o=bar the '&' need also some space
      length++;
  }

  query_str = malloc(QUERYMAXLEN);

  for (i = 0; i < element_counter; i++) {
    if (!elements[i]) {
      continue;
    }

    strncpy(query, elements[i], length); // Problem: Copy of query key value pair into query buffer without checking the length
    if (i == 0) {
      // query_str is empty when i = 0 so safe to copy a single char into it
      strcpy(query_str, "?");
    } else {
      if (QUERYMAXLEN - strlen(query_str) > 1) {
        strncat(query_str, &separator, 1);
      }
    }

    // note: query string will be truncated if too long
    if (QUERYMAXLEN - strlen(query_str) > 0) {
      strncat(query_str, query, QUERYMAXLEN - strlen(query_str));
    } else {
      break;
    }

    free(elements[i]);
  }

  strncpy(query, query_str, QUERYMAXLEN);
  free(query_str);
  free(elements);
  return 0;
}

int main() {
  char query[QUERYMAXLEN];
  char **elements = (char **)malloc(5 * sizeof(char *));
  elements[0] = getRandomString(5, 100);
  elements[1] = getRandomString(5, 100);
  elements[2] = getRandomString(5, 100);
  elements[3] = getRandomString(5, 100);
  elements[4] = getRandomString(5, 100);

  get_query(elements, 5, (char *)&query, '&');
  printf("%s\n", query);
}
