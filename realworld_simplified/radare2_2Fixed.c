// https://www.cvedetails.com/cve/CVE-2023-4322/
// repository: https://github.com/radareorg/radare2
// commit: 78fafcb
// extract of: libr/arch/p/bf/plugin.c (function: decode)

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct r_anal_op_t {
  int size;
  uint8_t *bytes;
} RAnalOp;

size_t countChar(const uint8_t *buf, int len, char ch) {
  size_t i;
  for (i = 0; i < len; i++) {
    if (buf[i] != ch) {
      break;
    }
  }
  return i;
}

int decode(RAnalOp *op) {
  int len = op->size;
  uint8_t *buf = op->bytes;
  if (len < 1) {
    return false;
  }
  switch (buf[0]) {
  case '[':
    buf = malloc(0xff);
    if (len > 0xff) {
      memcpy(buf, op->bytes, 0xff); // copy fixed number of characters and try to find closing bracket among them
    } else {
      memcpy(buf, op->bytes, len);
    }

    const uint8_t *p = buf + 1;
    int i = 1;
    len--;
    while (i < len && i < 0xfe && *p) {
      if (*p == ']') {
        op->size = i;
        goto beach;
      } else if (*p == 0x00 || *p == 0xff) {
        goto beach;
      }
      p++;
      i++;
    }
  beach:
    free(buf);
    break;
  case '>':
    op->size = countChar(buf, len, '>');
    break;
  case '<':
    op->size = countChar(buf, len, '<');
    break;
  }
  return op->size;
}

int main() {
  RAnalOp op = {0};
  op.size = 400; // overflow happens if value is greater then 255
  op.bytes = calloc(op.size, sizeof(uint8_t));
  if (op.bytes == NULL) {
    printf("Out of memory!\n");
    return 1;
  }
  memset(op.bytes, 'A', op.size - 1);
  op.bytes[0] = '[';

  int size = decode(&op);
  printf("Decoded size: %d\n", size);

  free(op.bytes);
}
