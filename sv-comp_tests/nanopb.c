// https://www.cvedetails.com/cve/CVE-2014-125106/
// repository: https://github.com/nanopb/nanopb
// commit: d0466bd
// extract of: pb_decode.c (function: pb_dec_string)

// Similar issue:
// - https://www.cvedetails.com/cve/CVE-2023-38403/

#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

typedef struct pb_istream_s {
  bool (*callback)(struct pb_istream_s *stream, uint8_t *buf, size_t count);
  void *state;
  size_t bytes_left;
} pb_istream_t;

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

static bool buf_read(pb_istream_t *stream, uint8_t *buf, size_t count)
{
  if (stream->bytes_left < count) {
    printf("try to read more data then remaining in stream buffer\n");
    return false;
  }
  uint8_t *source = (uint8_t*)stream->state;
  stream->state = source + count;
  stream->bytes_left -= count;
  
  if (buf != NULL)
  {
    while (count--)
      *buf++ = *source++;
  }
  
  return true;
}

pb_istream_t pb_istream_from_buffer(uint8_t *buf, size_t bufsize)
{
  pb_istream_t stream = {0};
  stream.callback = &buf_read;
  stream.state = buf;
  stream.bytes_left = bufsize;
  return stream;
}

bool pb_dec_string(pb_istream_t *stream, void **dest) {
  uint32_t size;
  size_t alloc_size;

  if (!stream->callback(stream, (uint8_t *)&size, 4))
    return false;

  /* Space for null terminator */
  alloc_size = size + 1; // Problem: in case read data is 0xff, 0xff, 0xff, 0xff adding 1 to it will cause unsigned integer overflow

  *dest = malloc(alloc_size);
  if (*dest == NULL) {
    return false;
  }

  bool status = stream->callback(stream, *dest, size);
  ((char *)(*dest))[size] = '\0'; // buffer overflow if calloc returned 0 page pointer
  return status;
}

// althorugh decoding word is used there is not decoding for simplicity sake.
// decoding word was preserved as functions names were taken from nanopb project without modification
int main() {
  // unsigned char data[] = {
  //   0xff, 0xff, 0xff, 0xff, // malicious size 
  //   // 0x46, 0x00, 0x00, 0x00, // correct size
  //   0x54, 0x68, 0x69, 0x73, 0x20, 0x73, 0x74, 0x72, 0x69, 0x6e, 0x67, 0x20, 0x6c, 
  //   0x65, 0x6e, 0x67, 0x74, 0x68, 0x20, 0x69, 0x73, 0x20, 0x6d, 0x61, 0x6c, 0x69, 
  //   0x63, 0x69, 0x6f, 0x75, 0x73, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x63, 0x61, 0x75, 
  //   0x73, 0x65, 0x73, 0x20, 0x6f, 0x76, 0x65, 0x72, 0x66, 0x6c, 0x6f, 0x77, 0x20, 
  //   0x6f, 0x66, 0x20, 0x73, 0x69, 0x7a, 0x65, 0x5f, 0x74, 0x20, 0x76, 0x61, 0x72, 
  //   0x69, 0x61, 0x62, 0x6c, 0x65
  // };

  unsigned char* data = (unsigned char*)getRandomString(1, 1000);

  pb_istream_t stream = pb_istream_from_buffer(data, strlen(data));
  char* dest = NULL;
  if (!pb_dec_string(&stream, (void**)&dest)){ 
    printf("Decoding failed\n");
  } else {
    printf("Decoded string: %s\n", dest);
  }

  if (dest) {
    free(dest);
  }

  free(data);
}
