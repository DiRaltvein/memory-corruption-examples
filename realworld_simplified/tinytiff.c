// https://www.cvedetails.com/cve/CVE-2023-26733/
// repository: https://github.com/jkriege2/TinyTIFF
// commit: f13ce29
// extract of: src/tinytiffreader.c (function: TinyTIFFReader_readNextFrame)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TIFF_FIELD_IMAGEWIDTH 256
#define TIFF_FIELD_IMAGELENGTH 257
#define TIFF_FIELD_STRIPOFFSETS 273
#define TIFF_FIELD_SAMPLESPERPIXEL 277
#define TIFF_FIELD_ROWSPERSTRIP 278
#define TIFF_FIELD_SAMPLEFORMAT 339

#define TIFF_TYPE_BYTE 1
#define TIFF_TYPE_ASCII 2
#define TIFF_TYPE_SHORT 3
#define TIFF_TYPE_LONG 4

typedef struct TinyTIFFReaderFrame {
  uint32_t width;
  uint32_t rowsperstrip;
  uint32_t *stripoffsets;
  uint32_t stripcount;
  uint16_t samplesperpixel;
  uint16_t sampleformat;
  uint32_t imagelength;
  uint8_t orientation;
} TinyTIFFReaderFrame;

typedef struct TinyTIFFReader_IFD {
  uint16_t tag;
  uint16_t type;
  uint32_t value;

  uint32_t *pvalue;
} TinyTIFFReader_IFD;

typedef struct _TinyTIFFReaderFile {
  FILE *file;
  TinyTIFFReaderFrame currentFrame;
} TinyTIFFReaderFile;

uint32_t TinyTIFFReader_readuint32(TinyTIFFReaderFile *tiff) {
  uint32_t res = 0;
  size_t size = fread(&res, 4, 1, tiff->file);
  if (size != 1) {
    return 0;
  }
  return res;
}

uint16_t TinyTIFFReader_readuint16(TinyTIFFReaderFile *tiff) {
  uint16_t res = 0;
  size_t size = fread(&res, 2, 1, tiff->file);
  if (size != 1) {
    return 0;
  }
  return res;
}

uint8_t TinyTIFFReader_readuint8(TinyTIFFReaderFile *tiff) {
  uint8_t res = 0;
  size_t size = fread(&res, 1, 1, tiff->file);
  if (size != 1) {
    return 0;
  }
  return res;
}

TinyTIFFReader_IFD *TinyTIFFReader_readIFD(TinyTIFFReaderFile *tiff) {
  TinyTIFFReader_IFD *d = (TinyTIFFReader_IFD*)calloc(1, sizeof(TinyTIFFReader_IFD));
  if (d == NULL)
    return NULL;
  d->pvalue = 0;

  d->tag = TinyTIFFReader_readuint16(tiff);
  if (d->tag == 0) {
    free(d);
    return NULL;
  }
  d->type = TinyTIFFReader_readuint16(tiff);
  if (d->type == 0) {
    free(d);
    return NULL;
  }
  d->value = TinyTIFFReader_readuint32(tiff);
  if (d->value == 0 || d->value > 0xffff) {
    free(d);
    return NULL;
  }

  switch (d->type) {
  case TIFF_TYPE_BYTE:
  case TIFF_TYPE_ASCII:
    d->pvalue = (uint32_t *)calloc(d->value, sizeof(uint32_t));
    if (d->pvalue == NULL) {
      free(d);
      return NULL;
    }
    for (size_t i = 0; i < d->value; i++) {
      d->pvalue[i] = TinyTIFFReader_readuint8(tiff);
      if (d->pvalue[i] == 0) {
        free(d->pvalue);
        free(d);
        return NULL;
      }
    }
    break;
  case TIFF_TYPE_SHORT:
    d->pvalue = (uint32_t *)calloc(d->value, sizeof(uint32_t));
    if (d->pvalue == NULL) {
      free(d);
      return NULL;
    }
    for (size_t i = 0; i < d->value; i++) {
      d->pvalue[i] = TinyTIFFReader_readuint16(tiff);
      if (d->pvalue[i] == 0) {
        free(d->pvalue);
        free(d);
        return NULL;
      }
    }
    break;
  case TIFF_TYPE_LONG:
    d->pvalue = (uint32_t *)calloc(d->value, sizeof(uint32_t));
    if (d->pvalue == NULL) {
      free(d);
      return NULL;
    }
    for (size_t i = 0; i < d->value; i++) {
      d->pvalue[i] = TinyTIFFReader_readuint32(tiff);
      if (d->pvalue[i] == 0) {
        free(d->pvalue);
        free(d);
        return NULL;
      }
    }
    break;
  default: // do nothing;
    break;
  }

  return d;
}

void TinyTIFFReader_readNextFrame(TinyTIFFReaderFile *tiff) {
  uint16_t ifd_count = TinyTIFFReader_readuint16(tiff);
  for (uint16_t i = 0; i < ifd_count; i++) {
    TinyTIFFReader_IFD *ifd = TinyTIFFReader_readIFD(tiff);
    if (ifd == NULL)
      return;

    switch (ifd->tag) {
    case TIFF_FIELD_IMAGEWIDTH:
      tiff->currentFrame.width = ifd->value;
      break;
    case TIFF_FIELD_IMAGELENGTH:
      tiff->currentFrame.imagelength = ifd->value;
      break;
    case TIFF_FIELD_STRIPOFFSETS: {
      tiff->currentFrame.stripcount = ifd->value;
      if (tiff->currentFrame.stripoffsets != NULL) {
        free(tiff->currentFrame.stripoffsets);
      }
      tiff->currentFrame.stripoffsets = (uint32_t *)calloc(ifd->value, sizeof(uint32_t));
      if (tiff->currentFrame.stripoffsets == NULL)
        break;
      memcpy(tiff->currentFrame.stripoffsets, ifd->pvalue, ifd->value * sizeof(uint32_t)); // Problem: in case ifd->pvalue is 0 memcpy will fail
    } break;
    case TIFF_FIELD_SAMPLESPERPIXEL:
      tiff->currentFrame.samplesperpixel = ifd->value;
      break;
    case TIFF_FIELD_ROWSPERSTRIP:
      tiff->currentFrame.rowsperstrip = ifd->value;
      break;
    case TIFF_FIELD_SAMPLEFORMAT:
      tiff->currentFrame.sampleformat = ifd->value;
      break;
    default: // do nothing;
      break;
    }

    if (ifd->pvalue) {
      free(ifd->pvalue);
    }
    free(ifd);
  }
}

int main() {
  TinyTIFFReaderFile tiff = {0};
  tiff.file = fopen("tinytiff.hex", "r");
  if (tiff.file == NULL)
    return 1;
  TinyTIFFReader_readNextFrame(&tiff);

  printf("Frame width: %u\n", tiff.currentFrame.width);
  printf("Frame imagelength: %u\n", tiff.currentFrame.imagelength);
  if (tiff.currentFrame.stripcount > 0 && tiff.currentFrame.stripoffsets != NULL) {
    for (uint16_t i = 0; i < tiff.currentFrame.stripcount; i++) {
      printf("Frame stripoffset %d : %u\n", i + 1, tiff.currentFrame.stripoffsets[i]);
    }
  }
  printf("Frame samplesperpixel: %u\n", tiff.currentFrame.samplesperpixel);
  printf("Frame rowsperstrip: %u\n", tiff.currentFrame.rowsperstrip);
  printf("Frame sampleformat: %u\n", tiff.currentFrame.sampleformat);

  if (tiff.currentFrame.stripoffsets != NULL) {
    free(tiff.currentFrame.stripoffsets);
  }
  fclose(tiff.file);
}
