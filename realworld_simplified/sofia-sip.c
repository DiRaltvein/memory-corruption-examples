// https://www.cvedetails.com/cve/CVE-2022-31003/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 5f18366
// extract of: libsofia-sip-ua/sdp/sdp_parse.c (function: parse_message)

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char *rest;
  char record[6];
  strcpy(record, "Hello");
  rest = record + 6;  // Problem: rest is pointing to the memory behind \0 because record can hold only 6 characters including null terminator.
  printf("%s", rest); // is used to prevent rest not used/accessed warning
}
