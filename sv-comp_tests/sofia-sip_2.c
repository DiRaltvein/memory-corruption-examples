// https://www.cvedetails.com/cve/CVE-2023-22741/
// repository: https://github.com/freeswitch/sofia-sip
// commit: 2cb3820
// extract of: libsofia-sip-ua/stun/stun_common.c (function: stun_parse_attribute)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define STUN_A_LAST_MANDATORY 0x2020
#define STUN_A_OPTIONAL 0x7fff
#define MAPPED_ADDRESS 0x0001
#define RESPONSE_ADDRESS 0x0002

#define get16(b, offset)      \
  (((b)[(offset) + 0] << 8) | \
   ((b)[(offset) + 1] << 0))

typedef struct stun_buffer_s {
  unsigned char *data;
  unsigned size;
} stun_buffer_t;

typedef struct stun_attr_s {
  stun_buffer_t enc_buf;
} stun_attr_t;

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }

  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}

void stun_parse_attribute(unsigned char *p, stun_attr_t **attr) {

  uint16_t attr_type = get16(p, 0);
  int len = get16(p, 2); // get length from p that is potentially user controller variable (or in this case just malicious hardcoded data)

  if (attr_type > STUN_A_LAST_MANDATORY && attr_type < STUN_A_OPTIONAL) {
    exit(1);
  }

  *attr = (stun_attr_t *)calloc(1, sizeof(stun_attr_t));
  if (!(*attr)) {
    printf("Out of memory!\n");
    exit(1);
  }
  p += 4;
  (*attr)->enc_buf.size = len;
  (*attr)->enc_buf.data = (unsigned char *)malloc(len);
  if (!(*attr)->enc_buf.data) {
    printf("Out of memory!\n");
    free(*attr);
    exit(1);
  }
  memcpy((*attr)->enc_buf.data, p, len); // Problem: reading data from p of length that was read from p. p may be smaller then len leading to buffer overflow
}

int main() {
  // unsigned char data[] = {
  //     0x00, 0x00, // attr_type that is not used in this program
  //     0x00, 0x20, // length of data that is bigger than actual data length (by 1)
  //     0x48, 0x65, 0x61, 0x70, 0x20, 0x62, 0x75, 0x66,
  //     0x66, 0x65, 0x72, 0x20, 0x6f, 0x76, 0x65, 0x72,
  //     0x66, 0x6c, 0x6f, 0x77, 0x20, 0x68, 0x61, 0x70,
  //     0x70, 0x65, 0x6e, 0x65, 0x64, 0x21, 0x00};

  char* data = getRandomString(5, 1000);

  stun_attr_t *attr = {0};
  stun_parse_attribute((unsigned char *)data, &attr);
  if (attr) {
    printf("data: %s\n", attr->enc_buf.data);
    free(attr->enc_buf.data);
    free(attr);
  }
  free(data);
}
