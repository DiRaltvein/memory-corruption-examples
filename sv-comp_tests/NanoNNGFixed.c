// https://www.cvedetails.com/cve/CVE-2023-34488/
// repository: https://github.com/nanomq/NanoNNG
// commit: bb6f17f
// extract of: src/sp/protocol/mqtt/mqtt_parser.c (function: conn_handler)

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "helpers.c"

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

  uint32_t max = limit + *pos;

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
    *pos = (*pos) + (*str_len);

    if (*pos >= max) {
      free(dest);
      *str_len = -1;
      return NULL;
    }
  }
  return dest;
}

int main() {
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

  char *body = (char*)copyn_utf8_str(packet, &pos, &len_of_str, max - pos);
  if (body == NULL) {
    free(packet);
    return 1;
  }
	printf("Decoded sentence: %s\n", body);

	printf("Some out of bound memory access byte: %u", packet[pos]);

  free(body);
  free(packet);
}
