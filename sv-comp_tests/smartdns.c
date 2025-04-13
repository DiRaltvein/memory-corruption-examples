// https://www.cvedetails.com/cve/CVE-2023-31470/
// repository: https://github.com/pymumu/smartdns
// commit: e38d5ea
// extract of: src/dns.c (function: _dns_encode_domain)

#include <stdio.h>
#include <stdlib.h>
#include "helpers.c"

#define DNS_MAX_CNAME_LEN 256
#define DNS_PACKET_DICT_SIZE 16

struct dns_packet_dict_item {
  unsigned short pos;
  unsigned int hash;
};

struct dns_packet_dict {
  short dict_count;
  struct dns_packet_dict_item names[DNS_PACKET_DICT_SIZE];
};

struct dns_context {
  int maxsize;
  struct dns_packet_dict namedict;
  unsigned char *ptr;
  unsigned char *data;
};

static inline int _dns_left_len(struct dns_context *context) {
  return context->maxsize - (context->ptr - context->data);
}

static void _dns_write_short(unsigned char **buffer, unsigned short value) {
  *((unsigned short *)(*buffer)) = value;
  *buffer += 2;
}

static unsigned int dict_hash(const char *s) {
  unsigned int hashval = 0;
  for (hashval = 0; *s != '\0'; s++) {
    hashval = *s + 31 * hashval;
  }
  return hashval;
}

static int _dns_add_domain_dict(struct dns_context *context, unsigned int hash, int pos) {
  struct dns_packet_dict *dict = &context->namedict;

  if (dict->dict_count >= DNS_PACKET_DICT_SIZE) {
    return -1;
  }

  if (hash == 0) {
    return -1;
  }

  if (pos >= context->maxsize) {
    return -1;
  }

  int index = dict->dict_count;
  dict->names[index].hash = hash;
  dict->names[index].pos = pos;
  dict->dict_count++;

  return 0;
}

static int _dns_get_domain_offset(struct dns_context *context, const char *domain) {
  int i = 0;

  struct dns_packet_dict *dict = &context->namedict;

  if (*domain == '\0') {
    return -1;
  }

  unsigned int hash = dict_hash(domain);
  for (i = 0; i < dict->dict_count; i++) {
    if (dict->names[i].hash == hash) {
      return dict->names[i].pos;
    }
  }

  _dns_add_domain_dict(context, hash, context->ptr - 1 - context->data);
  return -1;
}

int _dns_encode_domain(struct dns_context *context, const char *domain) {
  int num = 0;
  int total_len = 0;
  unsigned char *ptr_num = context->ptr++;

  int dict_offset = _dns_get_domain_offset(context, domain);
  total_len++;

  /*[len]string[len]string...[0]0 */
  while (_dns_left_len(context) > 1 && *domain != 0) {
    total_len++;
    if (dict_offset >= 0) {
      int offset = 0xc000 | dict_offset;
      _dns_write_short(&ptr_num, offset);
      context->ptr++;
      ptr_num = NULL;
      return total_len;
    }

    if (*domain == '.') {
      *ptr_num = num;
      num = 0;
      ptr_num = context->ptr;
      domain++;
      context->ptr++;
      dict_offset = _dns_get_domain_offset(context, domain);
      continue;
    }
    *context->ptr = *domain;
    num++;
    context->ptr++;
    domain++;
  }

  *ptr_num = num; // Problem: buffer overflow in case context->ptr is provided such that it points out of bound of context data buffer or at the last byte

  if (total_len > 1) {
    /* if domain is '\0', [domain] is '\0' */
    *(context->ptr) = 0;
    total_len++;
    context->ptr++;
  }

  if (_dns_left_len(context) <= 0) {
    return -1;
  }

  return total_len;
}

void hexPrint(unsigned char *arr) {
  unsigned char *ptr = arr;
  while (*ptr) {
    if (*ptr >= 0x20 && *ptr <= 0x7E) {
      printf("%c", *ptr);
    } else {
      printf("0x%02X", *ptr);
    }
    ptr++;
  }
  printf("\n");
}

// DNS domain encoding to a format of [number]domain[number]domain[number]domain....
// in addition to encoding also DNS compression pointers can be used that point
int main() {
  int total_len = 0;
  struct dns_context context = {0};
  context.maxsize = 200;
  context.data = calloc(context.maxsize, sizeof(unsigned char));
  if (!context.data) {
    printf("Out of memory!\n");
    return 1;
  }
  context.ptr = context.data;
  for (int i = 0; i < getNumberInRange(1, 10); i++) {
    char* domainToEncode = getRandomString(10, 50);
    int encodedLength = _dns_encode_domain(&context, domainToEncode);
    if (encodedLength > 0) {
      printf("Encoded domain: ");
      hexPrint(context.data + total_len);
      total_len += encodedLength;
    } else {
      printf("Error occured while encoding domain: [%s]\n", domainToEncode);
    }
    free(domainToEncode);
  }
  free(context.data);
}
