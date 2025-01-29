// https://www.cvedetails.com/cve/CVE-2022-31003/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 5f18366
// extract of: libsofia-sip-ua/sdp/sdp_parse.c (function: parse_message)

#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }
  char *rest = argv[1] + 2; // Problem: rest may be pointing to a memory after first argument effectively leading to a read out of bound in the next line
  printf("%s\n", rest);
}
