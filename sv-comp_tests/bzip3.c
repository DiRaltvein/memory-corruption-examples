// https://www.cvedetails.com/cve/CVE-2023-29421/
// repository: https://github.com/kspalaiologos/bzip3
// commit: 8d433c4
// extract of: src/libbz3.c (function: bz3_decode_block)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

typedef uint8_t u8;
typedef uint32_t u32;
typedef int32_t s32;

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

size_t bz3_bound(size_t input_size) { return input_size + input_size / 50 + 32; }

static s32 read_neutral_s32(const u8 *data) {
  return ((u32)data[0]) | (((u32)data[1]) << 8) | (((u32)data[2]) << 16) | (((u32)data[3]) << 24);
}

s32 bz3_decode_block(unsigned char *datap, unsigned char *decoded_data, s32 data_size, s32 decoded_data_size) {
  if (*datap == 0xFF) {
    decoded_data_size = read_neutral_s32(datap + 1);
    datap += 5;
    data_size -= 5;
  }
  s32 decodedDataFinalSize = 0;
  unsigned char *decodedDataInternalBuffer = malloc(decoded_data_size);
  if (!decodedDataInternalBuffer) {
    printf("Out of memory\n");
    return -1;
  }

  // 'Decoding'
  for (int i = 0; i < data_size && decodedDataFinalSize < decoded_data_size; i++) {
    if (datap[i] == 'A') {
      if (decodedDataFinalSize + 8 < decoded_data_size) {
        strcpy((char *)decodedDataInternalBuffer + decodedDataFinalSize, "triple A");
        decodedDataFinalSize += 8;
        continue;
      } else {
        break;
      }
    }
    decodedDataInternalBuffer[decodedDataFinalSize++] = datap[i];
  }
  //

  decodedDataInternalBuffer[decoded_data_size - 1] = '\0';

  if (decodedDataFinalSize > bz3_bound(decoded_data_size) || decodedDataFinalSize < 0) {
    printf("decodedDataFinalSize length is greater than decoded_data_size\n");
    free(decodedDataInternalBuffer);
    return -1;
  }

  memcpy(decoded_data, decodedDataInternalBuffer, decodedDataFinalSize); // Problem: decodedDataFinalSize can be greater than decoded_data buffer length
  free(decodedDataInternalBuffer);

  return decodedDataFinalSize;
}

int main() {
  // unsigned char data[] = {
  //     0x0C, 0x00, 0x00, 0x00, // decoded data size
  //     0xFF,                   // decoding flag
  //     0x26, 0x00, 0x00, 0x00, // actual decoded size
  //     0x41, 0x42, 0x42, 0x42, 0x42, 0x42, 0x41, 0x42, 0x42, 0x41, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42};
  // size_t in_size = sizeof(data) / sizeof(data[0]);

  unsigned char* data = (unsigned char*)getRandomString(10, 1000);
  size_t in_size = strlen(data);

  unsigned char *datap = data;

  if (in_size < 4)
    return 1;
  u32 orig_size = read_neutral_s32(datap);
  if(orig_size > 10000) {
    printf("Invalid decoded data size\n");
    return 1;
  }
  in_size -= 4;
  datap += 4;

  unsigned char *decoded_data = malloc(orig_size);
  if (!decoded_data) {
    printf("Out of memory\n");
    return 1;
  }

  if (bz3_decode_block(datap, decoded_data, in_size, orig_size) != -1) {
    printf("Decoded data: %s\n", decoded_data);
  }
  free(decoded_data);
}
