// https://www.cvedetails.com/cve/CVE-2023-48105/
// repository: https://github.com/bytecodealliance/wasm-micro-runtime
// commit: 52db362
// extract of: core/iwasm/interpreter/wasm_loader.c (function: wasm_loader_prepare_bytecode)

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define TEMPLATE_READ_VALUE(Type, p) \
  (p += sizeof(Type), *(Type *)(p - sizeof(Type)))

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

int main() {
  uint8_t* p_ar = (uint8_t*)getRandomString(0, 500);
  uint8_t *p = p_ar;
  uint8_t *p_end = p + strlen(p_ar);

  while (p < p_end) {
    uint8_t val = TEMPLATE_READ_VALUE(uint8_t, p);
    printf("%d\n", val);
  }
  free(p_ar);
}
