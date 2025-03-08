// https://www.cvedetails.com/cve/CVE-2023-36239/
// repository: https://github.com/libming/libming
// commit: 6f91d1a
// extract of: util/parser.c (function: parseSWF_DEFINEFONTINFO)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

struct Movie {
  int version;
  int size; /* in bytes */
};

struct MovieBlock {
  char *fontName;
  int nGlyph;
  uint16_t *CodeTable;
};

int fileOffset = 0;
struct Movie m;

int readUInt8(FILE *f) {
  int tmp_char = fgetc(f);
  if (tmp_char == EOF) {
    fprintf(stderr, "truncated file\n");
    exit(-1);
  }
  ++fileOffset;
  return tmp_char;
}

unsigned long readUInt32(FILE *f) {
  return (unsigned long)(readUInt8(f) + (readUInt8(f) << 8) + (readUInt8(f) << 16) + (readUInt8(f) << 24));
}

int readUInt16(FILE *f) {
  return readUInt8(f) + (readUInt8(f) << 8);
}

static int filelen_check_fails(int minLength) {
  if (m.size - fileOffset < minLength) {
    printf("sudden file end: read failed @%i fileSize %i, request %i\n",
           fileOffset, m.size, minLength);
    return -1;
  }
  return 0;
}

char *readSizedString(FILE *f, int size) {
  int len = 0, buflen = 256, i;
  char c, *buf, *p;

  buf = (char *)malloc(sizeof(char) * buflen);
  p = buf;

  for (i = 0; i < size; i++) {
    c = (char)readUInt8(f);
    if (len >= buflen - 2) {
      buf = (char *)realloc(buf, sizeof(char) * (buflen + 256));
      buflen += 256;
      p = buf + len;
    }

    switch (c) {
    case '\n':
      *(p++) = '\\';
      *(p++) = 'n';
      ++len;
      break;
    case '\t':
      *(p++) = '\\';
      *(p++) = 't';
      ++len;
      break;
    case '\r':
      *(p++) = '\\';
      *(p++) = 'r';
      ++len;
      break;
    default:
      *(p++) = c;
    }

    ++len;
  }

  *p = 0;

  return buf;
}

// the problem is as follows:
// if the function was called with length of lets say 50 and fileOffset 10 then end will be evaluated to 60 in the beginning
// now after reading 1 byte for fontNameLen and also the font name itself fileOffset will change to a new value lets say 100
// nGlyph will then become 60 - 100 = -40. In turn when passed to malloc -40 will be interpreted as unsigned integer and will become very big value
struct MovieBlock *parseSWF_DEFINEFONTINFO(FILE *f, int length) {
  struct MovieBlock *parserrec = calloc(1, sizeof(struct MovieBlock));
  if (parserrec == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  int end = fileOffset + length;

  uint8_t fontNameLen = readUInt8(f);
  parserrec->fontName = readSizedString(f, fontNameLen);

  parserrec->nGlyph = end - fileOffset;
  parserrec->CodeTable = (uint16_t *)malloc(parserrec->nGlyph * sizeof(uint16_t)); // Problem: malloc size can be too bit and malloc may fail to allocate memory
  for (int i = 0; i < parserrec->nGlyph; i++) {
    parserrec->CodeTable[i] = readUInt8(f);
  }
  return parserrec;
}

static int readMovieHeader(FILE *f) {
  char first = readUInt8(f);
  struct stat stat_buf;

  if (!((first == 'C' || first == 'F') && readUInt8(f) == 'W' && readUInt8(f) == 'S')) {
    printf("Doesn't look like a swf file to me..\n");
    exit(1);
  }
  m.version = readUInt8(f);
  m.size = readUInt32(f);

  if (fstat(fileno(f), &stat_buf) < 0) { // verify file size!
    perror("stat failed: ");
    return -1;
  }

  if (m.size != stat_buf.st_size) {
    printf("header indicates a filesize of %d but filesize is %lu\n", m.size, stat_buf.st_size);
    m.size = stat_buf.st_size;
  }
  return 0;
}

static void readMovie(FILE *f) {
  int block, type, length, nextFrame = 0;

  for (;;) {
    if (filelen_check_fails(2)) {
      break;
    }

    block = readUInt16(f);
    type = block >> 6;

    length = block & ((1 << 6) - 1);

    if (length == 63) /* it's a long block. */
    {
      if (filelen_check_fails(4)) {
        break;
      }
      length = readUInt32(f);
    }
    nextFrame = fileOffset + length;

    if (filelen_check_fails(length)) {
      break;
    }
    struct MovieBlock *parserrec = parseSWF_DEFINEFONTINFO(f, length);

    printf("Read font name: %s\n", parserrec->fontName);
    free(parserrec->fontName);

    if (parserrec->nGlyph) {
      if (*parserrec->CodeTable == 'a') {
        printf("This is only here to dereference parserrec->CodeTable buffer that very well may be a null/zero pointer\n");
      }
      for (int i = 0; i < parserrec->nGlyph; i++) {
        printf("Read glyph at position %d: 0x%02X\n", i, parserrec->CodeTable[i]);
      }
    }
    free(parserrec->CodeTable);

    free(parserrec);

    if (type == 0 || fileOffset >= m.size) {
      break;
    }

    fseek(f, nextFrame, SEEK_SET);
    fileOffset = ftell(f);
  }
}

int main() {
  FILE *f = fopen("libming.hex", "r");
  if (f == NULL) {
    printf("Can not open file\n");
    return 1;
  }

  if (readMovieHeader(f)) {
    printf("Error reading header data\n");
    fclose(f);
    return 1;
  }

  readMovie(f);
  fclose(f);
}
