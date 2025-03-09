// https://www.cvedetails.com/cve/CVE-2022-47094/
// repository: https://github.com/gpac/gpac
// commit: 706111f
// extract of: src/filters/dmx_m2ts.c (function: m2tsdmx_declare_pid)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

typedef struct {
  uint32_t size;
  char *descriptor;
} GF_List;

typedef struct {
  GF_List *ESDescriptors;
} GF_InitialObjectDescriptor;

typedef struct {
  GF_InitialObjectDescriptor *pmt_iod;
} GF_M2TS_Program;

typedef struct tag_m2ts_pes {
  GF_M2TS_Program *program;
  uint32_t stream_type;
} GF_M2TS_PES;

char gf_list_get(GF_List *ptr, uint32_t itemNumber) {
  if (!ptr)
    return 0;
  return ptr->descriptor[itemNumber];
}

int gf_list_count(GF_List *ptr) {
  if (!ptr)
    return 0;
  return ptr->size;
}

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

static int parseStream(GF_M2TS_PES *stream, unsigned char *data, size_t dataSize) {
  if (dataSize < 4) {
    printf("Corrupted stream\n");
    return 1;
  }
  memcpy(&stream->stream_type, data, sizeof(uint32_t));
  size_t datai = 4;

  while (datai < dataSize) {
    if (data[datai] == 0xf0 && dataSize - datai > 5) { // in case 0xf0 byte is not found pmt_iod is not initialized
      datai++;
      stream->program->pmt_iod = calloc(1, sizeof(GF_InitialObjectDescriptor));
      if (stream->program->pmt_iod == NULL) {
        printf("Out of memory\n");
        return 1;
      }
      stream->program->pmt_iod->ESDescriptors = calloc(1, sizeof(GF_List));
      if (stream->program->pmt_iod->ESDescriptors == NULL) {
        printf("Out of memory\n");
        return 1;
      }
      memcpy(&stream->program->pmt_iod->ESDescriptors->size, data + datai, sizeof(uint32_t));
      datai += 4;
      if (stream->program->pmt_iod->ESDescriptors->size > dataSize - datai) {
        printf("Corupted stream\n");
        return 1;
      }
      stream->program->pmt_iod->ESDescriptors->descriptor = calloc(stream->program->pmt_iod->ESDescriptors->size + 1, sizeof(char));
      if (stream->program->pmt_iod->ESDescriptors->descriptor == NULL) {
        printf("Out of memory\n");
        return 1;
      }
      memcpy(stream->program->pmt_iod->ESDescriptors->descriptor, data + datai, stream->program->pmt_iod->ESDescriptors->size);
      break;
    }
    datai++;
  }
  return 0;
}

static void m2tsdmx_declare_pid(GF_M2TS_PES *stream) {
  uint32_t count;

  switch (stream->stream_type) {
  case 1:
    printf("1\n");
    break;
  case 2:
    printf("1\n");
    break;
  case 18:
    count = gf_list_count(stream->program->pmt_iod->ESDescriptors); // Problem: pmt_iod and ESDescriptors are not initialized
    for (size_t i = 0; i < count; i++) {
      char esd = gf_list_get(stream->program->pmt_iod->ESDescriptors, i);
      if (esd == 'a') {
        printf("a found in descriptors list\n");
        break;
      }
    }
    break;
  }
}

void freeStream(GF_M2TS_PES *stream) {
  if (stream->program->pmt_iod) {
    if (stream->program->pmt_iod->ESDescriptors) {
      free(stream->program->pmt_iod->ESDescriptors->descriptor);
      free(stream->program->pmt_iod->ESDescriptors);
    }
    free(stream->program->pmt_iod);
  }
  free(stream->program);
}

int main() {
  // unsigned char data[] = "\x12\x00\x00\x00hello some random string\xf0\x15";
  // size_t dataSize = 31;

  unsigned char* data = (unsigned char*)getRandomString(5, 500);

  GF_M2TS_PES stream = {0};
  stream.program = calloc(1, sizeof(GF_M2TS_Program));
  if (stream.program == NULL) {
    printf("Out of memory\n");
    return 1;
  }

  if (parseStream(&stream, (unsigned char *)data, strlen(data)) == 0) {
    m2tsdmx_declare_pid(&stream);
  }

  freeStream(&stream);
}
