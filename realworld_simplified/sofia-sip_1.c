// https://www.cvedetails.com/cve/CVE-2023-32307/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 3f17604
// extract of: libsofia-sip-ua/stun/stun_common.c (function: stun_parse_attr_error_code)

#include <stdio.h>
#include <string.h>

typedef unsigned int uint32_t;
// But is it a problem? memory sanitizer does not think so
int main(int argc, char *argv[]) {
  if (argc < 2)
    return 0;
  uint32_t tmp;
  memcpy(&tmp, argv[1], sizeof(uint32_t)); // Problem: access out of bound if command line arguments length is less than 3 characters
}
