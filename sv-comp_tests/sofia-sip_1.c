// https://www.cvedetails.com/cve/CVE-2023-32307/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 3f17604
// extract of: libsofia-sip-ua/stun/stun_common.c (function: stun_parse_attr_error_code)

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);

#define STUN_A_LAST_MANDATORY 0x0023
#define STUN_A_OPTIONAL 0x7fff
#define get16(b, offset)      \
  (((b)[(offset) + 0] << 8) | \
   ((b)[(offset) + 1] << 0))

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

void stun_parse_attr_error_code(const unsigned char *p) {
  uint32_t tmp;

  memcpy(&tmp, p, sizeof(uint32_t)); // Problem: access out of bound of pointer p as remaining length is not checked
  printf("Parsed value: %u\n", tmp);
}

int stun_parse_attribute(unsigned char *p, size_t left_len) {
  int len;
  uint16_t attr_type;

  attr_type = get16(p, 0);
  len = get16(p, 2);

  if ((left_len - 4) < len) // make sure we have enough space for attribute
  {
    printf("Error STUN attr len is too big.\n");
    return -1;
  }

  if (attr_type > STUN_A_LAST_MANDATORY && attr_type < STUN_A_OPTIONAL) {
    return -1;
  }

  p += 4;
  if (attr_type == 0x0009) {
    stun_parse_attr_error_code(p);
    return 0;
  }
  return 1;
}

int main() {
  // unsigned char data[] = {
  //     0x00, 0x09, 0x00, 0x00, 0x00};
  // size_t length = sizeof(data) / sizeof(data[0]);
  int size = getNumberInRange(4, 100);
  unsigned char* data = getRandomByteStream(size);

  int ret = stun_parse_attribute(data, size);
  free(data);
  return ret;
}
