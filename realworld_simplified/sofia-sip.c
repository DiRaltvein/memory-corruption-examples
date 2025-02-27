// https://www.cvedetails.com/cve/CVE-2022-31003/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 5f18366
// extract of: libsofia-sip-ua/sdp/sdp_parse.c (function: parse_message)

#include <stdio.h>

// input like ./a.out 'c' will produce unexpected result
int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: %s <string to parse>\n", argv[0]);
    return 1;
  }

  char *record = argv[1];
  char field = record[0];
  char *rest = record + 2; // Problem: rest may be pointing to a memory after first argument effectively leading to a read out of bound in the next line

  switch (field) {
  case 'o':
  case 's':
  case 'i':
    printf("option o, value: %s", rest); // Problem: potentiall read out of bound or rest
    break;
  case 'c':
    while (*rest) {
      printf("%c", *rest); // Problem: potentiall read out of bound or rest
      rest++;
    }
  }

  printf("\n");
}
