// https://www.cvedetails.com/cve/CVE-2023-48105/
// repository: https://github.com/bytecodealliance/wasm-micro-runtime
// commit: 52db362
// extract of: core/iwasm/interpreter/wasm_loader.c (function: wasm_loader_prepare_bytecode)

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);


#define TEMPLATE_READ_VALUE(Type, p) \
  (p += sizeof(Type), *(Type *)(p - sizeof(Type))) // Problem: read out of bound. Initially given pointer (p) may be out of bound by 1 and it is dereferenced

  
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

int main() {
  int size = getNumberInRange(0, 50);
  uint8_t* p_ar = (uint8_t*)getRandomByteStream(size);
  uint8_t *p = p_ar;
  uint8_t *p_end = p + size;

  while (p < p_end) {
    uint8_t val = TEMPLATE_READ_VALUE(uint8_t, p);
    printf("%d\n", val);
  }
  free(p_ar);
}
