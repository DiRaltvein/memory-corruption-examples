// https://www.cvedetails.com/cve/CVE-2023-34488/
// repository: https://github.com/nanomq/NanoNNG
// commit: bb6f17f
// extract of: src/sp/protocol/mqtt/mqtt_parser.c (function: conn_handler)

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define CMD_CONNECT 0x10

#define NNI_GET16(ptr, v)                       \
  v = (((uint16_t)((uint8_t)(ptr)[0])) << 8u) + \
      (((uint16_t)(uint8_t)(ptr)[1]))

static uint64_t power(uint64_t x, uint32_t n) {
  uint64_t val = 1;

  for (uint32_t i = 0; i <= n; ++i) {
    val = x * val;
  }

  return val / x;
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

/**
 * Get variable integer value
 *
 * @param buf Byte array
 * @param pos how many bits rlen occupied (accumulated value)
 * @return Integer value
 */
uint32_t get_var_integer(const uint8_t *buf, uint32_t *pos) {
  uint8_t temp;
  uint32_t result = 0;

  uint32_t p = *pos;
  int i = 0;

  do {
    temp = *(buf + p);
    result = result + (uint32_t)(temp & 0x7f) * (power(0x80, i));
    p++;
  } while ((temp & 0x80) > 0 && i++ < 4);
  *pos = p;
  return result;
}

/**
 * @brief safe copy limit size of src data to dest
 * 	  return null and -1 strlen if buffer overflow
 * @param src
 * @param pos the index cursor of processed packet, will be moved
 * @param str_len target size of data
 * @param limit max size of data copied
 * @return uint8_t* NULL if overflow or not utf-8
 */
uint8_t *copyn_utf8_str(const uint8_t *src, uint32_t *pos, int *str_len, int limit) {
  *str_len = 0;
  uint8_t *dest = NULL;

  // remaining length must > 2 for a valid length
  if (limit < 2)
    return NULL;

  NNI_GET16(src + (*pos), *str_len);
  *pos = (*pos) + 2;
  if (*str_len > (limit - 2)) {
    // buffer overflow
    *str_len = -1;
    return NULL;
  }
  if (*str_len > 0) {
    if ((dest = malloc(*str_len + 1)) == NULL) {
      *str_len = 0;
      return NULL;
    }
    memcpy(dest, src + (*pos), *str_len);
    dest[*str_len] = '\0';
    *pos = (*pos) + (*str_len); // pos index goes out of bound of packet buffer
  }
  return dest;
}

int main() {
  // uint8_t packet[] = {
	// 	0x10,
	// 	0xFF, 0xFF, 0x03,
	// 	0x00, 0x2e,
	// 	0x43, 0x20, 0x70, 0x72, 0x6F, 0x67, 0x72, 0x61,
	// 	0x6D, 0x6D, 0x69, 0x6E, 0x67, 0x20, 0x69, 0x73,
	// 	0x20, 0x66, 0x75, 0x6E, 0x20, 0x61, 0x6E, 0x64,
	// 	0x20, 0x63, 0x68, 0x61, 0x6C, 0x6C, 0x65, 0x6E,
	// 	0x67, 0x69, 0x6E, 0x67, 0x20, 0x74, 0x6F, 0x20,
	// 	0x6C, 0x65, 0x61, 0x72, 0x6E, 0x2E
  // };
  // size_t max = sizeof(packet) / sizeof(packet[0]);

  char* packet = getRandomString(50, 500);
  size_t max = strlen(packet);

  uint32_t pos = 0, len_of_var = 0;
  int len_of_str = 0;

  if (packet[pos] != CMD_CONNECT) {
    printf("Malformed packet\n");
    free(packet);
    return 1;
  } else {
    pos++;
  }

  uint32_t len = (uint32_t)get_var_integer(packet + pos, &len_of_var);
  printf("Decoded length: %u\n", len);
  pos += len_of_var;

  char *body = (char *)copyn_utf8_str(packet, &pos, &len_of_str, max - pos);
  if (body == NULL) {
    free(packet);
    return 1;
  }
	printf("Decoded sentence: %s\n", body);

	printf("Some out of bound memory access byte: %u", packet[pos]); // Problem: access of packet out of bound

  free(body);
  free(packet);
}
