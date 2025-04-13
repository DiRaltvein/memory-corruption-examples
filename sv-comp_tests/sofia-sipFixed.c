// https://www.cvedetails.com/cve/CVE-2022-31003/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 5f18366
// extract of: libsofia-sip-ua/sdp/sdp_parse.c (function: parse_message)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

int main() {
  char *record = getRandomString(0, 500);
  if (strlen(record) < 3) {
    printf("Input too small\n");
    free(record);
    return 1;
  }
  char field = record[0];
  char *rest = record + 2;

  switch (field) {
  case 'o':
  case 's':
  case 'i':
    printf("option o, value: %s", rest);
    break;
  case 'c':
    while (*rest) {
      printf("%c", *rest);
      rest++;
    }
  }

  free(record);
  printf("\n");
}
