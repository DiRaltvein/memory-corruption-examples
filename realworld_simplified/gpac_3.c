// https://www.cvedetails.com/cve/CVE-2022-47659/
// repository: https://github.com/gpac/gpac
// commit: 2bcc36b
// extract of: src/filters/reframe_latm.c (function: latm_dmx_process)

#include <stdlib.h>
#include <string.h>

int getAnInt(int max) {
  return rand() % (max + 1);
}

void latm_dmx_sync_frame_bs(char *buffer) {
  int size = getAnInt(9000);
  memset(buffer, 9, size); // Problem: memset can set memory outside of the provided buffer in size is greater than 380
}

int main(int argc, char *argv[]) {
  char latm_buffer[380];
  latm_dmx_sync_frame_bs(latm_buffer);
}
