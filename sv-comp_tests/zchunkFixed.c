// https://www.cvedetails.com/cve/CVE-2023-46228/
// repository: https://github.com/zchunk/zchunk
// commit: 67f921e
// extract of: src/lib/comp/comp.c (function: comp_add_to_data)

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);

#define bool _Bool

typedef struct {
  unsigned char *data;
  uint32_t data_size;
} zckComp;

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

uint32_t readUInt32(const unsigned char *ptr, uint32_t offset) {
  uint32_t value = ((uint32_t)ptr[offset + 3]) << 24;
  value += ptr[offset + 2] << 16;
  value += ptr[offset + 1] << 8;
  value += ptr[offset];
  return value;
}

bool comp_add_to_data(zckComp *comp, const unsigned char *src, uint32_t src_size) {

  if ((comp->data_size > comp->data_size + src_size) || (src_size > comp->data_size + src_size)) {
    return false;
  }

  unsigned char *temp = (unsigned char*)realloc(comp->data, comp->data_size + src_size);
  if (!temp) {
    printf("Reallocation failed\n");
    return false;
  }
  comp->data = temp;
  memcpy(comp->data + comp->data_size, src, src_size);
  comp->data_size += src_size;
  return true;
}

// Program reads entries from file in form: (tag 1 byte), (length 4 byte), null terminated string
// if tag is not 0x50 it is skipped. Values of tags with value 0x50 tags are concatinated togeather and printed at the end of function
int main() {
  uint32_t data_length = getNumberInRange(5, 1000);
  unsigned char* data = getRandomByteStream(data_length);
  uint32_t offset = 0;

  zckComp comp = {0};
  comp.data = (unsigned char*)calloc(6, sizeof(unsigned char));
  if (comp.data == NULL) {
    printf("out of memory");
    free(data);
    return 1;
  }
  memcpy(comp.data, "Data: ", 6);
  comp.data_size = 6;

  int tag = 0;
  uint32_t length = 0;
  while (data_length > offset + 5) {
    tag = data[offset++];
    length = readUInt32(data, offset);
    offset += 4;
    if (offset + length > data_length || offset + length < offset || length == 0) { // Still integer overflow
      break;
    }
    if (tag == 0x50) {
      comp_add_to_data(&comp, data + offset, length);
    } else {
      printf("skipping tag: 0x%.2X\n", tag);
    }
    offset += length;
  }

  unsigned char zeroByteArray[] = {0x00};
  comp_add_to_data(&comp, (unsigned char *)&zeroByteArray, 1);
  printf("concatinated value of tag 0x50: %s\n", comp.data);
  free(comp.data);
  free(data);
}
