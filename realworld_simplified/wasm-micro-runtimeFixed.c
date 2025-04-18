// https://www.cvedetails.com/cve/CVE-2023-48105/
// repository: https://github.com/bytecodealliance/wasm-micro-runtime
// commit: 52db362
// extract of: core/iwasm/interpreter/wasm_loader.c (function: wasm_loader_prepare_bytecode)

#include <stdint.h>
#include <stdio.h>

#define TEMPLATE_READ_VALUE(Type, p) \
  (p += sizeof(Type), *(Type *)(p - sizeof(Type)))

int main() {
  uint8_t p_ar[3] = {0, 1, 2};
  uint8_t *p = p_ar;
  uint8_t *p_end = p + 3;

  while (p < p_end) {
    uint8_t val = TEMPLATE_READ_VALUE(uint8_t, p);
    printf("%d\n", val);
  }
}
