// https://www.cvedetails.com/cve/CVE-2023-37457/
// repository: https://github.com/asterisk/asterisk
// commit: 39760d1
// extract of: res/res_pjsip_header_funcs.c (function: update_header)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define NUMBER_OF_HEADERS 3

typedef struct _header {
  char *value;
  char *key;
} Header;

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

Header *findAHeader(Header *headers, char *header) {
  for (int i = 0; i < NUMBER_OF_HEADERS; i++) { // hardcode the number of headers for simplicity
    if (strcmp(headers[i].key, header) == 0) {
      return &headers[i];
    }
  }
  return NULL;
}

void update_header(Header *headers, char *header, char *newValue) {
  Header *foundHeader = findAHeader(headers, header);
  if (foundHeader == NULL) {
    printf("Could not find header to update\n");
  } else {
    memcpy(foundHeader->value, newValue, strlen(newValue)); // Problem: when updating header value new value is longer then the initial value and during update new value is just copied into existing buffer causing buffer overflow
  }
}

Header *initializeHeaders() {
  Header *headers = calloc(NUMBER_OF_HEADERS, sizeof(Header));
  if (headers == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  headers[0].key = strdup("Content-Type");
  headers[0].value = strdup("application/json");
  headers[1].key = strdup("Authorization");
  headers[1].value = strdup("Bearer ...");
  headers[2].key = strdup("Content-Length");
  headers[2].value = strdup("1234567");
  return headers;
}

int main() {
  Header *headers = initializeHeaders();
  char headerToUpdate[] = "Content-Length";
  char *newHeaderValue = getRandomString(2, 10);
  update_header(headers, (char *)headerToUpdate, newHeaderValue);

  for (int i = 0; i < NUMBER_OF_HEADERS; i++) {
    printf("[%s] - %s\n", headers[i].key, headers[i].value);
    free(headers[i].key);
    free(headers[i].value);
  }
  free(newHeaderValue);
  free(headers);
}
