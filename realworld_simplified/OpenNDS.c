// https://www.cvedetails.com/cve/CVE-2023-38313/
// repository: https://github.com/openNDS/openNDS
// commit: 8214525
// extract of: src/http_microhttpd.c (function: preauthenticated)

#include <string.h>

char *get_redirect_url(int argc) {
  if (argc < 2)
    return NULL;
  return "redirect url";
}

int main(int argc, char *argv[]) {
  const char *redirect_url;
  redirect_url = get_redirect_url(argc);
  return strlen(redirect_url); // Problem: null pointer dereference
}
