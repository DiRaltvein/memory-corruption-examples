// https://www.cvedetails.com/cve/CVE-2021-32142/
// repository: https://github.com/LibRaw/LibRaw
// commit: 1dbed6b
// extract of: src/libraw_datastream.cpp (function: LibRaw_buffer_datastream::gets)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define fgets(str,n,stream)       stream->gets(str,n)
#define fget(str,n,stream)       stream->get(str,n)

typedef unsigned short int ushort;

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

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

class LibRaw_buffer_datastream {
  public:
    virtual char *gets(char *s, int sz);
    virtual char *get(char *s, int sz);
    LibRaw_buffer_datastream(unsigned char* data, size_t size) {
      buf = data;
      streampos = 0;
      streamsize = size;
    }
  private:
    unsigned char *buf;
    size_t streampos, streamsize;
};

char *LibRaw_buffer_datastream::gets(char *s, int sz)
{
  unsigned char *psrc, *pdest, *str;
  str = (unsigned char *)s;
  psrc = buf + streampos;
  pdest = str;
  if(streampos >= streamsize) return NULL;
  while ((size_t(psrc - buf) < streamsize) && ((pdest - str) < (sz-1)))
  {
    *pdest = *psrc;
    if (*psrc == '\n')
      break;
    psrc++;
    pdest++;
  }
  if (size_t(psrc - buf) < streamsize)
    psrc++;
  if ((pdest - str) < sz-1)
    *(++pdest) = 0;
  else
    // ensure trailing zero
    s[sz - 1] = 0; // Problem: in case sz is 0 this 0 assignment will result in s buffer underflow

  streampos = psrc - buf;
  return s;
}

char *LibRaw_buffer_datastream::get(char *s, int sz) {
  unsigned char *psrc, *pdest, *str;
  str = (unsigned char *)s;
  psrc = buf + streampos;
  pdest = str;
  if(streampos >= streamsize) return NULL;
  while ((size_t(psrc - buf) < streamsize) && ((pdest - str) < (sz))) {
    *pdest++ = *psrc++;
  }
  streampos = psrc - buf;
  return s;
}

ushort get2(LibRaw_buffer_datastream *ds)
{
  unsigned char str[] = {0xff, 0xff};
  fget((char* )str, 2, ds);
  return str[0] << 8 | str[1];
};

unsigned get4(LibRaw_buffer_datastream *ds)
{
  unsigned char str[4] = {0xff, 0xff, 0xff, 0xff};
  fget((char* )str, 4, ds);
  return str[0] << 24 | str[1] << 16 | str[2] << 8 | str[3];
};


int parse_exif(LibRaw_buffer_datastream *ds) {
  unsigned entries, tag, type, len;

  entries = get2(ds);
  if (entries > 512) {
    printf("Too much entries found. Probably malformed file\n");
    return 1;
  }

  while (entries--) {
    tag = get2(ds);
    type = get2(ds);
    len = get4(ds);

    switch (tag) {
      case 0x927c:
        char mn_text[20];
        fgets(mn_text, MIN(len, 19), ds);
        mn_text[19] = 0;

        printf("tag: [%u], type: [%u], len: [%u], value: %s\n", tag, type, len, mn_text);
        break;
      default:
        int value = get4(ds);
        printf("tag: [%u], type: [%u], len: [%u], value: %d\n", tag, type, len, value);
    }
  }

  return 0;
}

int main() {
  // unsigned char data[] = {
  //   0x00, 0x02, // 2 entries
  
  //   0x00, 0x00, // tag
  //   0x00, 0x00, // data type
  //   0x00, 0x00, 0x00, 0x01, // length
  //   0x00, 0x00, 0x02, 0x00, // value

  //   0x92, 0x7c, // tag
  //   0x00, 0x00, // data type
  //   0x00, 0x00, 0x00, 0x00, // length
  //   0x41, 0x42, 0x43, 0x00, // value
  // };

  char* randomString = getRandomString(5, 500);

  LibRaw_buffer_datastream ds((unsigned char*)randomString, strlen(randomString));

  int re = parse_exif(&ds);
  free(randomString);
  return re;
}
