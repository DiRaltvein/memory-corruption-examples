// https://www.cvedetails.com/cve/CVE-2023-2905/
// repository: https://github.com/cesanta/mongoose
// commit: 8114443
// extract of: src/mqtt.c (function: decode_variable_length)

#include <stdio.h>

static int decode_variable_length(const char *buf, int *bytes_consumed, int bufSize) {
  int value = 0, multiplier = 1, offset;

  for (offset = 0; offset < 4 && offset < bufSize; offset++) {
    char encoded_byte = buf[offset]; // Problem: reading from a buffer (buf) which length is smaller than 4
    value += encoded_byte * multiplier;
    multiplier *= 128;

    if (!(encoded_byte & 0x10)) {
      break;
    }
  }

  if (bytes_consumed != NULL)
    *bytes_consumed = offset + 1;

  return value;
}

int main() {
  char buf[] = {0x1A, 0x1B, 0x1C};
  int bytes_consumed = 0;
  int decodedValue = decode_variable_length((char *)buf, &bytes_consumed, sizeof(buf));
  printf("Value: %d, bytes consumed: %d\n", decodedValue, bytes_consumed);
}
