// https://www.cvedetails.com/cve/CVE-2023-23609/
// repository: https://github.com/contiki-ng/contiki-ng
// commit: c2334371e
// extract of: os/net/mac/ble/ble-l2cap.c (function: input_l2cap_frame_flow_channel)

#include <string.h>

int main(int argc, char *argv[]) {
  unsigned char m_oValue[48];
  memcpy(m_oValue, argv[0], sizeof(argv[0])); // Problem: if executable name is larger than 48 bytes then buffer will overflow
}
