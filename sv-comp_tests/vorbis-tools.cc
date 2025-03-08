// https://www.cvedetails.com/cve/CVE-2023-43361/
// repository: https://github.com/xiph/vorbis-tools
// commit: 7168723
// extract of: oggenc/platform.c (function: create_directorie)

#include <cstring>

int main() {
  char fn[] = "/home/test/";

  char *end, *start;

  start = fn;

  while ((end = strpbrk(start + 1, "/")) != NULL) { // Problem: start + 1 results in an access out of bound even after null byte
    start = end + 1;
  }
}
