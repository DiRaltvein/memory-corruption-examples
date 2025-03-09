// https://www.cvedetails.com/cve/CVE-2023-46932/
// repository: https://github.com/gpac/gpac
// commit: f181717
// extract of: src/media_tools/avilib.c (function: avi_parse_input_file)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define strnicmp strncasecmp
#define PAD_EVEN(x) (((x) + 1) & ~1)

typedef struct {
  unsigned char *data;
  size_t data_size;
  // index to what data has been read. In initial gpac avi_parse_input_file function FILE is used and this index is tracked automatically.
  // Because test case uses buffer rather than a FILE such index is required.
  size_t pos;
} avi_t;

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

static uint32_t avi_read(avi_t *AVI, char *buf, uint32_t len) {
  size_t r = 0;

  while (r < len && AVI->pos < AVI->data_size) {
    buf[r++] = AVI->data[AVI->pos++];
  }

  return r;
}

static uint32_t str2ulong(unsigned char *str) {
  return ((uint32_t)str[0] | ((uint32_t)str[1] << 8) | ((uint32_t)str[2] << 16) | ((uint32_t)str[3] << 24)); // Problem: buffer overflow passed str is shorter than 4 bytes
}

int avi_parse_input_file(avi_t *AVI) {
  int64_t n, i;
  char data[256];

  if (avi_read(AVI, data, 12) != 12) {
    printf("Error reading from buffer\n");
    return 1;
  }

  if (strnicmp(data, "RIFF", 4) != 0 || strnicmp(data + 8, "AVI ", 4) != 0) {
    printf("Not a valid avi file (even through we parse locally hardcoded buffer initially parsed was avi file)\n");
    return 1;
  }

  int hdrl_len = 0;
  unsigned char *hdrl_data = 0;

  while (1) {
    if (avi_read(AVI, data, 8) != 8)
      break; /* We assume it's EOF */

    n = str2ulong((unsigned char *)data + 4);
    n = PAD_EVEN(n);

    if (strnicmp(data, "LIST", 4) == 0) {
      if (avi_read(AVI, data, 4) != 4) {
        printf("Error reading from buffer\n");
        return 1;
      }
      n -= 4;
      if (strnicmp(data, "hdrl", 4) == 0) {
        if (n > 0xFFFFFFFF) {
          printf("Error reading from buffer\n");
          return 1;
        }
        hdrl_len = (uint32_t)n;
        if (hdrl_data) {
          free(hdrl_data);
        }
        hdrl_data = (unsigned char *)malloc((uint32_t)n);
        if (hdrl_data == 0) {
          printf("Out of memory\n");
          return 1;
        }

        if (avi_read(AVI, (char *)hdrl_data, (uint32_t)n) != n) {
          if (hdrl_data) {
            free(hdrl_data);
          }
          printf("Error reading from buffer. hdrl section length is wrong\n");
          return 1;
        }
      }
    }
    AVI->pos += n;
  }

  if (!hdrl_data) {
    printf("hdrl section was not found in provided buffer\n");
    return 1;
  }

  for (i = 0; i < hdrl_len;) {
    if (strnicmp((char *)hdrl_data + i, "LIST", 4) == 0) {
      i += 12;
      continue;
    }
    // Problem: bound check is done in for loop by making sure i as index is valid for hdrl_len buffer.
    // Now in str2ulong function hdrl_data will be accessed with index i + 3 and this address may not be valid
    n = str2ulong(hdrl_data + i + 4);
    n = PAD_EVEN(n);
    if (i + n > hdrl_len) {
      printf("hdrl section length is corrupted\n");
      free(hdrl_data);
      return 1;
    }

    hdrl_data[i + 4] = 0;
    printf("Skipping section: %s \n", hdrl_data + i);

    i += (uint32_t)n + 8;
  }

  free(hdrl_data);
  return 0;
}

int main() {
  // unsigned char data[] = {
  //     0x52, 0x49, 0x46, 0x46, // RIFF (is used to determine that file is AVI file)
  //     0x00, 0x00, 0x00, 0x00,
  //     0x41, 0x56, 0x49, 0x20, // AVI (is used to determine that file is AVI file)

  //     0x4C, 0x49, 0x53, 0x54, // LIST
  //     0x38, 0x00, 0x00, 0x00, // section length (malicious correct is 0x36)
  //     0x68, 0x64, 0x72, 0x6C, // hdrl

  //     0x61, 0x76, 0x69, 0x68,             // avih (subheader in hdrl section)
  //     0x06, 0x00, 0x00, 0x00,             // avih section size
  //     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // random data

  //     0x73, 0x74, 0x72, 0x68,                         // strh (subheader in hdrl section)
  //     0x08, 0x00, 0x00, 0x00,                         // strh section size
  //     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // random data

  //     0x76, 0x69, 0x64, 0x73,                                                 // vids (subheader in hdrl section)
  //     0x0C, 0x00, 0x00, 0x00,                                                 // vids section size
  //     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // random data

  //     0x00, 0x00 // random data that is not part of hdrl section
  // };
  // size_t dataSize = sizeof(data) / sizeof(data[0]);

  unsigned char *data = getRandomString(5, 1000);
  size_t dataSize = strlen(data);

  avi_t AVI = {0};
  AVI.data = (unsigned char *)data;
  AVI.data_size = dataSize;
  AVI.pos = 0;

  return avi_parse_input_file(&AVI);
}
