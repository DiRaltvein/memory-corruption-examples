// https://www.cvedetails.com/cve/CVE-2023-29421/
// repository: https://github.com/kspalaiologos/bzip3
// commit: 8d433c4
// extract of: src/libbz3.c (function: bz3_decode_block)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);

typedef uint8_t u8;
typedef uint32_t u32;
typedef int32_t s32;

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

static s32 read_neutral_s32(const u8 *data) {
  return ((u32)data[0]) | (((u32)data[1]) << 8) | (((u32)data[2]) << 16) | (((u32)data[3]) << 24);
}

s32 bz3_decode_block(unsigned char *datap, unsigned char *decoded_data, s32 data_size, s32 decoded_data_size) {
  s32 decodedDataFinalSize = 0;
  unsigned char *decodedDataInternalBuffer = (unsigned char *)calloc(decoded_data_size, sizeof(unsigned char));
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

  if (decodedDataFinalSize > decoded_data_size || decodedDataFinalSize < 0) {
    printf("decodedDataFinalSize length is greater than decoded_data_size\n");
    free(decodedDataInternalBuffer);
    return -1;
  }

  memcpy(decoded_data, decodedDataInternalBuffer, decodedDataFinalSize);
  free(decodedDataInternalBuffer);

  return decodedDataFinalSize;
}

int main() {
  size_t in_size = getNumberInRange(10, 1000);
  unsigned char* data = getRandomByteStream(in_size);
  unsigned char *datap = data;

  if (in_size < 4)
    return 1;
  u32 orig_size = read_neutral_s32(datap);
  in_size -= 4;
  datap += 4;

  unsigned char *decoded_data = (unsigned char *)calloc(orig_size, sizeof(unsigned char));
  if (!decoded_data) {
    printf("Out of memory\n");
    return 1;
  }

  if (bz3_decode_block(datap, decoded_data, in_size, orig_size) != -1) {
    printf("Decoded data: %s\n", decoded_data);
  }
  free(decoded_data);
}
