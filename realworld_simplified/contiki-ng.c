// https://www.cvedetails.com/cve/CVE-2023-23609/
// repository: https://github.com/contiki-ng/contiki-ng
// commit: c2334371e
// extract of: os/net/mac/ble/ble-l2cap.c (function: input_l2cap_frame_flow_channel)

#include <string.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  unsigned char m_oValue[48];
  memcpy(m_oValue, argv[1], strlen(argv[1])); // Problem: if first argument is longer than 48 characters then buffer will overflow
}
