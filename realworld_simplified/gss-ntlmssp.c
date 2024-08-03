// https://www.cvedetails.com/cve/CVE-2023-25564/
// repository: https://github.com/gssapi/gss-ntlmssp
// commit: 97c62c6
// extract of: src/ntlm.c (function: ntlm_decode_u16l_str_hdr)

#include <stdlib.h>
#include <string.h>

// dymmy function that copies input (in) to the output (out) and in the end sets outlen to be equal to the output string size
// can fail in case input (in) contains character 'a'
int ntlm_str_convert(const char *in, char *out, size_t *outlen) {

  for (int i = 0; i < sizeof(*in); i++) {
    if (in[i] == 'a') {
      return 1;
    }
    out[i] = in[i];
  }

  if (outlen) {
    *outlen = sizeof(out);
  }
  return 0;
}

int main(int argc, char *argv[]) {
  size_t outlen;

  char *out = malloc(strlen(argv[0]) + 1);
  ntlm_str_convert(argv[0], out, &outlen);
  out[outlen] = '\0'; // Problem: in case ntlm_str_convert function failed then outlen is not defined
  free(out);
}
