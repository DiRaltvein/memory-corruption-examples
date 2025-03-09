// https://www.cvedetails.com/cve/CVE-2021-45423/
// repository: https://github.com/merces/libpe
// commit: 4d9c279
// extract of: exports.c (function: pe_exports)

#include <stdio.h>
#include <stdlib.h>

#define LIBPE_PTR_ADD(p, o) ((void *)((char *)(p) + (o)))

typedef unsigned long long uint64_t;
typedef unsigned short uint16_t;

extern int __VERIFIER_nondet_int(void);

typedef struct pe_ctx {
  int NumberOfFunctions;
  int NumberOfNames;
  void *map_addr;
} pe_ctx_t;

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

void initCtxMapAddr(pe_ctx_t *ctx) {
  ctx->map_addr = malloc(ctx->NumberOfNames * sizeof(uint16_t));

  for (int i = 0; i < ctx->NumberOfNames; i++) {
    uint16_t *entry_ordinal_list = LIBPE_PTR_ADD(ctx->map_addr, sizeof(uint16_t) * i);
    *entry_ordinal_list = i;
  }
}

int main() {
  pe_ctx_t ctx = {0};
  ctx.NumberOfFunctions = getNumberInRange(5, 50);
  ctx.NumberOfNames = ctx.NumberOfFunctions * 2;
  initCtxMapAddr(&ctx);

  uint16_t *offsets_to_Names = malloc(ctx.NumberOfFunctions * sizeof(uint16_t));

  for (int i = 0; i < ctx.NumberOfNames; i++) {
    uint16_t *entry_ordinal_list = LIBPE_PTR_ADD(ctx.map_addr, sizeof(uint16_t) * i);
    offsets_to_Names[*entry_ordinal_list] = 5; // Problem: buffer overflow
  }

  free(offsets_to_Names);
  free(ctx.map_addr);
}
