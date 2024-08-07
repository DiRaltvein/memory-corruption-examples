// https://www.cvedetails.com/cve/CVE-2023-34488/
// repository: https://github.com/nanomq/NanoNNG
// commit: bb6f17f
// extract of: src/sp/protocol/mqtt/mqtt_parser.c (function: conn_handler)

#include <stdlib.h>

void conn_handler(char *packet) {
  packet[26] = 'b'; // Problem
}

int main(int argc, char *argv[]) {
  if (argc > 10)
    return 1;
  char *packet = malloc(argc * 8);
  conn_handler(packet);
  free(packet);
}
