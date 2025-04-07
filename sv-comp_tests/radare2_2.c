// https://www.cvedetails.com/cve/CVE-2023-4322/
// repository: https://github.com/radareorg/radare2
// commit: 78fafcb
// extract of: libr/arch/p/bf/plugin.c (function: decode)

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);

typedef struct r_anal_op_t {
  int size;
  uint8_t *bytes;
} RAnalOp;

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

/**
 * Just a utility function in test creation that generates random sequence of unsigned characters (sequence is not zero terminated)
 */
unsigned char *getRandomByteStream(int size) {
  unsigned char *randomString = (unsigned char*)calloc(size, sizeof(unsigned char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_uchar();
  }
  return randomString;
}

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
    while (i < len && *p) { // Problem: Read out of bound of pointer p because length is greater than 255
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
  op.size = getNumberInRange(5, 1000);
  op.bytes = (uint8_t*)getRandomByteStream(op.size);
  // op.size = 400; // overflow happens if value is greater then 255
  // op.bytes = calloc(op.size, sizeof(uint8_t));
  // if (op.bytes == NULL) {
  //   printf("Out of memory!\n");
  //   return 1;
  // }
  // memset(op.bytes, 'A', op.size - 1);
  // op.bytes[0] = '[';

  int size = decode(&op);
  printf("Decoded size: %d\n", size);

  free(op.bytes);
}
