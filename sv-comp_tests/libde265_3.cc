// https://www.cvedetails.com/cve/CVE-2023-49468/
// repository: https://github.com/strukturag/libde265
// commit: 03988ce
// extract of: libde265/slice.cc (function: read_coding_unit)

#include <stdio.h>
#include <stdint.h>
#include <assert.h>
#include <stdlib.h>

enum IntraPredMode
{
  INTRA_PLANAR = 0,
  INTRA_DC = 1,
  INTRA_ANGULAR_2 = 2,    INTRA_ANGULAR_3 = 3,    INTRA_ANGULAR_4 = 4,    INTRA_ANGULAR_5 = 5,
  INTRA_ANGULAR_6 = 6,    INTRA_ANGULAR_7 = 7,    INTRA_ANGULAR_8 = 8,    INTRA_ANGULAR_9 = 9,
  INTRA_ANGULAR_10 = 10,  INTRA_ANGULAR_11 = 11,  INTRA_ANGULAR_12 = 12,  INTRA_ANGULAR_13 = 13,
  INTRA_ANGULAR_14 = 14,  INTRA_ANGULAR_15 = 15,  INTRA_ANGULAR_16 = 16,  INTRA_ANGULAR_17 = 17,
  INTRA_ANGULAR_18 = 18,  INTRA_ANGULAR_19 = 19,  INTRA_ANGULAR_20 = 20,  INTRA_ANGULAR_21 = 21,
  INTRA_ANGULAR_22 = 22,  INTRA_ANGULAR_23 = 23,  INTRA_ANGULAR_24 = 24,  INTRA_ANGULAR_25 = 25,
  INTRA_ANGULAR_26 = 26,  INTRA_ANGULAR_27 = 27,  INTRA_ANGULAR_28 = 28,  INTRA_ANGULAR_29 = 29,
  INTRA_ANGULAR_30 = 30,  INTRA_ANGULAR_31 = 31,  INTRA_ANGULAR_32 = 32,  INTRA_ANGULAR_33 = 33,
  INTRA_ANGULAR_34 = 34
};

typedef struct _MetaDataArray {
  unsigned char* data;
  int data_size;
  int log2unitSize;
  int width_in_units;
  int height_in_units;
} MetaDataArray;

enum IntraPredMode get_IntraPredMode(MetaDataArray *data, int x,int y)
{

  assert(x >= 0 && x < data->width_in_units);
  assert(y >= 0 && y < data->height_in_units);

  int byteIndex = 2 + x + y*data->width_in_units;

  assert (byteIndex < data->data_size);

  return (enum IntraPredMode)data->data[ byteIndex ];
}

int map_chroma_pred_mode(int intra_chroma_pred_mode, int IntraPredMode)
{
  if (intra_chroma_pred_mode==4) {
    return IntraPredMode;
  }
  else {
    static const enum IntraPredMode IntraPredModeCCand[4] = {
      INTRA_PLANAR,
      INTRA_ANGULAR_26, // vertical
      INTRA_ANGULAR_10, // horizontal
      INTRA_DC
    };

    int IntraPredModeC = IntraPredModeCCand[intra_chroma_pred_mode];
    if (IntraPredModeC == IntraPredMode) {
      return INTRA_ANGULAR_34;
    }
    else {
      return IntraPredModeC;
    }
  }
}

static const uint8_t map_chroma_422[35] = {
  0,1,2, 2, 2, 2, 3, 5, 7, 8,10,12,13,15,17,18,19,20,
  21,22,23,23,24,24,25,25,26,27,27,28,28,29,29,30,31
};

void read_coding_unit(MetaDataArray *data, int x0, int y0) {
  if (data->data_size < 2) {
    printf("Not enough data for processing\n");
    exit(1);
  }
  int intra_chroma_pred_mode = data->data[0];
  int ChromaArrayType = data->data[1];
  int IntraPredMode = get_IntraPredMode(data, x0,y0);
  int IntraPredModeC = map_chroma_pred_mode(intra_chroma_pred_mode, IntraPredMode);
  if (ChromaArrayType == 2) {
    IntraPredModeC = map_chroma_422[ IntraPredModeC ]; // Problem: IntraPredModeC is greater than 34 resulting in a read out of bound of buffer map_chroma_422
  }
  printf("IntraPredModeC: %d\n", IntraPredModeC);
}

int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Please, provide 2 numbers in range 0 - 5 that would be used to access a matrix of values\n");
    printf("Malicious input if 4 and 4\n");
    return 1;
  }
  unsigned char data[] = {
    0x04, 0x02,
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
    0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C,
    0x0D, 0x0F, 0x11, 0x12, 0x13, 0x14,
    0x15, 0x16, 0x17, 0x18, 0x19, 0x1A,
    0x1B, 0x1C, 0x1D, 0x1E, 0x50, 0x20,
    0x01, 0x02, 0x03, 0x04, 0x05, 0x06,
  };
  MetaDataArray dataObj = {0};
  dataObj.data = (unsigned char*) data;
  dataObj.data_size = sizeof(data) / sizeof(data[0]);
  dataObj.height_in_units = 6;
  dataObj.width_in_units = 6;
  dataObj.log2unitSize = 8;
  read_coding_unit(&dataObj, atoi(argv[1]), atoi(argv[2]));
}
