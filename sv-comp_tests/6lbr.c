// https://www.cvedetails.com/cve/CVE-2021-46901/
// repository: https://github.com/cetic/6lbr
// commit: c3092a1
// extract of: examples/6lbr/apps/6lbr-webserver/httpd.c (function: httpd_is_file)

#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  char filepath[100];
  strcpy(filepath, "/static/");
  strcat(filepath, argv[1]); // Problem: in case parameter is long enough buffer overflow will occur
  return access(filepath, R_OK) == 0;
}
