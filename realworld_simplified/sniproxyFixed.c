// https://www.cvedetails.com/cve/CVE-2023-25076/
// repository: https://github.com/dlundquist/sniproxy
// commit: 822bb80
// extract of: src/address.c (function: new_address)

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }
  char *hostname_or_ip = argv[1]; // mock packet parsing and just take ip address from terminal
  char *port;
  char ip_buf[262];
  size_t len;

  // try to parse hostname_or_ip like it is an ipv6 address of form [2001:db8:3333:4444:5555:6666:7777:8888]:443
  if (hostname_or_ip[0] == '[' &&
      (port = strchr(hostname_or_ip, ']')) != NULL) {
    len = (size_t)(port - hostname_or_ip - 1);
    if (len >= 200) {
      return 1;
    }

    strncpy(ip_buf, hostname_or_ip + 1, len);
    ip_buf[len] = '\0';

    printf("%s\n", ip_buf);
  }
}
