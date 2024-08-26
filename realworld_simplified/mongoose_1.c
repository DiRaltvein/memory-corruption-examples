// https://www.cvedetails.com/cve/CVE-2020-25887/
// repository: https://github.com/cesanta/mongoose
// commit: 9fe1c93c
// extract of: src/mg_resolv.c (function: mg_resolve_from_hosts_file)

#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  FILE *fp;
  char line[1024];
  char *p;
  char alias[60];
  unsigned int a, b, c, d;
  int len = 0;

  if ((fp = fopen("mongoose_1.txt", "r")) == NULL) {
    return -1;
  }

  for (; fgets(line, sizeof(line), fp) != NULL;) {
    if (sscanf(line, "%u.%u.%u.%u%n", &a, &b, &c, &d, &len) == 0) {
      continue;
    }
    for (p = line + len; sscanf(p, "%s%n", alias, &len) == 1; p += len) { // Problem: potential buffer overflow of alias buffer. Reading from a file and sscanf with assumption that alias if less than 60 characters
      if (strcmp(alias, argv[0]) == 0) {
        fclose(fp);
        return -1;
      }
    }
  }
  fclose(fp);
}
