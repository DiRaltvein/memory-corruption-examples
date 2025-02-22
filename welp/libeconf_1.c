// https://www.cvedetails.com/cve/CVE-2023-30079/
// repository: https://github.com/openSUSE/libeconf
// commit: 3abe0f3
// extract of: lib/getfilecontents.c (function: read_file)

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFSIZE 50

void read_file(const char *file, const char *delim, const char *comment) {
  char buf[BUFSIZE];

  FILE *kf = fopen(file, "rb");
  if (kf == NULL) {
    printf("Could not open file %s\n", file);
    return;
  }

  while (fgets(buf, sizeof(buf), kf)) {
    char *p, *name, *data = NULL;

    /* Remove trailing newline character */
    size_t n = strlen(buf);
    if (n && *(buf + n - 1) == '\n')
      *(buf + n - 1) = '\0';

    if (!*buf)
      continue; /* empty line */

    /* ignore space at begin of the line */
    name = buf;
    while (*name && isspace((unsigned)*name))
      name++;

    for (size_t i = 0; i < strlen(comment); i++) {
      p = strchr(name, comment[i]);
      if (p) {
        printf("Comment found: %s\n", p);
        *p = '\0';
      }
    }

    if (!*buf)
      continue; /* result is empty line */

    /* go to the end of the name */
    data = name;
    while (*data && !(isspace((unsigned)*data) || strchr(delim, *data) != NULL)) {
      data++;
    }

    if (data > name && *data) {
      *data++ = '\0';
    }

    if (!*name || data == name)
      continue;

    if (*data != '\0') {
      /* ignore space at begin of the value */
      while (*data && isspace((unsigned)*data))
        data++;

      /* remove space at the end of the value */
      p = data + strlen(data);
      if (p > data)
        p--;
      while (p > data && (isspace((unsigned)*p)))
        p--;
      if (*(p + 1) != '\0') {
        *(p + 1) = '\0'; // stack buffer overflow
      }
    }

    printf("Key: %s, value: %s\n", name, data);
  }
  fclose(kf);
}

int main() {
  read_file("libeconf_1.txt", "=", ";#");
}
