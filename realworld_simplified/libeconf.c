// https://www.cvedetails.com/cve/CVE-2023-30078/
// repository: https://github.com/openSUSE/libeconf
// commit: dcfc789
// extract of: lib/libeconf.c (function: econf_writeFile)

#include <stdio.h>
#include <string.h>

#define BUFSIZE 32

int main(int argc, char *argv[]) {
  char stringToCopy[BUFSIZE + 2] = "Books are windows to other worlds";
  char buf[BUFSIZE];
  char *line;
  char *value_string = buf;

  strncpy(buf, stringToCopy, BUFSIZE); // because stringToCopy is longer then the BUFSIZE no null terminator is appended to the buf when copying

  while ((line = strsep(&value_string, "\n")) != NULL) {
    printf("%s\n", line); // Problem: read out of bound. because buf is not null terminated strsep does not stop and goes further down the stack until another null byte is encountered.
  }
}
