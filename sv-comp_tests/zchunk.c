// https://www.cvedetails.com/cve/CVE-2023-46228/
// repository: https://github.com/zchunk/zchunk
// commit: 67f921e
// extract of: src/lib/comp/comp.c (function: comp_add_to_data)

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define bool _Bool

typedef struct {
  unsigned char *data;
  size_t data_size;
} zckComp;

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

size_t readUInt32(const unsigned char *ptr, size_t offset) {
  size_t value = ((size_t)ptr[offset + 3]) << 24;
  value += ptr[offset + 2] << 16;
  value += ptr[offset + 1] << 8;
  value += ptr[offset];
  return value;
}

bool comp_add_to_data(zckComp *comp, const unsigned char *src, size_t src_size) {
  unsigned char *temp = realloc(comp->data, comp->data_size + src_size); // Problem: integer overflow
  if (!temp) {
    printf("Reallocation failed\n");
    return false;
  }
  comp->data = temp;
  // Problem: if during realloc integer overflow happened then this memcpy will result in a buffer overflow
  // In addition, because src array is not validated memcpy may result in src buffer overflow if src buffer has no data
  memcpy(comp->data + comp->data_size, src, src_size);
  comp->data_size += src_size;
  return true;
}

// Program reads entries from file in form: (tag 1 byte), (length 4 byte), null terminated string
// if tag is not 0x50 it is skipped. Values of tags with value 0x50 tags are concatinated togeather and printed at the end of function
int main() {
  // unsigned char data[] = {
  //     0x50, 0x06, 0x00, 0x00, 0x00, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20,  // first message with tag 0x50 and length of 6
  //     0x10, 0x04, 0x00, 0x00, 0x00, 0x73, 0x6b, 0x69, 0x70,              // second message that is skipped with tag 0x10
  //     0x50, 0xff, 0xff, 0xff, 0xff, 0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21}; // third message with tag 0x50
  // size_t data_length = sizeof(data);
  char* data = getRandomString(5, 1000);
  size_t data_length = strlen(data);

  size_t offset = 0;

  zckComp comp = {0};
  comp.data = calloc(7, sizeof(unsigned char));
  if (!comp.data) {
    printf("out of memory");
    exit(1);
  }
  char dataArray[] = "Data: ";
  memcpy(comp.data, dataArray, 6);

  int tag = 0;
  size_t length = 0;
  while (data_length > offset + 4) {
    tag = data[offset++];
    length = readUInt32(data, offset);
    offset += 4;
    if (tag == 0x50) {
      comp_add_to_data(&comp, data + offset, length);
    } else {
      printf("skipping tag: 0x%.2X\n", tag);
    }
    offset += length;
  }

  unsigned char zeroByteArray[] = {0x00};
  comp_add_to_data(&comp, (unsigned char *)&zeroByteArray, 1);
  printf("concatinated value of tag x50: %s\n", comp.data);
  free(comp.data);
  free(data);
}
