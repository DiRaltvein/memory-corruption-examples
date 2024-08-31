// https://www.cvedetails.com/cve/CVE-2022-47094/
// repository: https://github.com/gpac/gpac
// commit: 706111f
// extract of: src/filters/dmx_m2ts.c (function: m2tsdmx_declare_pid)

#include <stdlib.h>

typedef struct {
  size_t entryCount;
} GF_List;

typedef struct {
  GF_List *ESDescriptors;
} GF_InitialObjectDescriptor;

typedef struct {
  GF_InitialObjectDescriptor *pmt_iod;
} GF_M2TS_Program;

typedef struct tag_m2ts_pes {
  GF_M2TS_Program *program;
} GF_M2TS_PES;

int gf_list_count(GF_List *ptr) {
  if (!ptr)
    return 0;
  return ptr->entryCount;
}

int main() {
  GF_M2TS_PES stream = {0};
  stream.program = malloc(sizeof(GF_M2TS_Program));

  gf_list_count(stream.program->pmt_iod->ESDescriptors); // Problem: pmt_iod and ESDescriptors are not initialized

  free(stream.program);
}
