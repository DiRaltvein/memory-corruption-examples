// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-2905/
// repository: https://github.com/cesanta/mongoose
// commit: 8114443
// extract of: src/mqtt.c (function: decode_variable_length)

#include "helpers.c"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int decode_variable_length(const uint8_t *buf, int *bytes_consumed, int bufSize) {
  int value = 0, multiplier = 2, offset;

  for (offset = 0; offset < 4 && offset < bufSize; offset++) {
    uint8_t encoded_byte = buf[offset];
    value += (encoded_byte & 0x7F) * multiplier;

    if (!(encoded_byte & 0x80)) {
      break;
    }
  }

  if (bytes_consumed != NULL)
    *bytes_consumed = offset + 1;

  return value;
}

int main() {
  int size = getNumberInRange(1, 500);
  uint8_t *buf = (uint8_t *)getRandomByteStream(size);
  int bytes_consumed = 0;
  int decodedValue = decode_variable_length(buf, &bytes_consumed, size);
  printf("Value: %d, bytes consumed: %d\n", decodedValue, bytes_consumed);
  free(buf);
}
