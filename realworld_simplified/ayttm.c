// https://www.cvedetails.com/cve/CVE-2015-10088/
// repository: https://github.com/ayttm/ayttm
// commit: da8940c
// extract of: libproxy/proxy.c (function: http_connect)

#include <stdio.h>

#define debug_print printf

int main(int argc, char *argv[]) {
  char cmd[512];
  char debug_buff[512];

  snprintf(cmd, sizeof(cmd), "CONNECT %s:%d HTTP/1.1\r\n", "%s %s %s %s %s %s", 443);
  snprintf(debug_buff, sizeof(debug_buff), "<%s>\n", cmd);
  debug_print(debug_buff); // Problem: printf without providing a format
}
