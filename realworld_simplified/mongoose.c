// https://www.cvedetails.com/cve/CVE-2023-2905/
// repository: https://github.com/cesanta/mongoose
// commit: 8114443
// extract of: src/mqtt.c (function: decode_variable_length)

#include <stdio.h>

int main(int argc, char *argv[]) {
  char *buf = argv[0];

  for (int offset = 0; offset < 10; offset++) {
    char encoded_byte = buf[offset]; // Problem: reading from a buffer which length can be smaller than 10
    printf("%s\n", &encoded_byte);
  }
}
