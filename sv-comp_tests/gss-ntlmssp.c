// https://www.cvedetails.com/cve/CVE-2023-25564/
// repository: https://github.com/gssapi/gss-ntlmssp
// commit: 97c62c6
// extract of: src/ntlm.c (function: ntlm_decode_u16l_str_hdr)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

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

// dymmy function that copies input (in) to the output (out) and in the end sets outlen to be equal to the output string size
// can fail in case input (in) contains character 'a'
int ntlm_str_convert(const char *in, char *out, size_t *outlen) {
  int i = 0;
  for (; i < strlen(in); i++) {
    if (in[i] == 'a') {
      return 1;
    }
    out[i] = in[i];
  }
  out[i] = '\0';

  if (outlen) {
    *outlen = strlen(out);
  }
  return 0;
}

int main() {
  char* string = getRandomString(10, 100);
  size_t outlen;

  char *out = malloc(strlen(string) + 1);
  ntlm_str_convert(string, out, &outlen);
  out[outlen] = '\0'; // Problem: in case ntlm_str_convert function failed then outlen is not defined
  free(out);
  free(string);
}
