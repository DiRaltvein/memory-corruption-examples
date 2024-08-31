// https://www.cvedetails.com/cve/CVE-2023-37457/
// repository: https://github.com/asterisk/asterisk
// commit: 39760d1
// extract of: res/res_pjsip_header_funcs.c (function: update_header)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _header {
  char *value;
  char *key;
} Header;

Header *findAHeader(Header *headers, char *header) {
  for (int i = 0; i < 3; i++) { // hardcode the number of headers for simplicity
    if (strcmp(headers[i].key, header) == 0) {
      return &headers[i];
    }
  }
  return NULL;
}

void update_header(Header *headers, char *header, char *newValue) {
  Header *foundHeader = findAHeader(headers, header);
  if (foundHeader == NULL) {
    exit(1);
  }
  memcpy(foundHeader->value, newValue, strlen(newValue)); // Problem: when updating header value new value is longer then the initial value and during update new value is just copied into existing buffer causing buffer overflow
}

Header *initializeHeaders() {
  Header *headers = malloc(sizeof(Header) * 3);
  headers[0].key = strdup("Content-Type");
  headers[0].value = strdup("application/json");
  headers[1].key = strdup("Authorization");
  headers[1].value = strdup("Bearer ...");
  headers[2].key = strdup("Content-Length");
  headers[2].value = strdup("12");
  return headers;
}

int main() {
  Header *headers = initializeHeaders();
  char *headerToUpdate = "Content-Length";
  char *newHeaderValue = "Over 999";
  update_header(headers, headerToUpdate, newHeaderValue);

  for (int i = 0; i < 3; i++) {
    printf("[%s] - %s\n", headers[i].key, headers[i].value);
    free(headers[i].key);
    free(headers[i].value);
  }
  free(headers);
}
