// https://www.cvedetails.com/cve/CVE-2021-32292/
// repository: https://github.com/json-c/json-c
// commit: 56a89f9
// extract of: json_parse.c (function: parseit)

#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

void parseit(int fd) {
  char buf[16];
  int ret;
  while ((ret = read(fd, buf, sizeof(buf))) > 0) {
    int start_pos = 0;
    int parse_end = 0;
    while (start_pos <= ret) {
      parse_end++;
      printf("%s\n", &buf[start_pos + parse_end]); // Problem: when reading from file the start_pos + parse_end summed would be greater then the buffer length
      start_pos += parse_end;
    }
  }
  close(fd);
}

int main(int argc, char *argv[]) {
  if (argc >= 2) {
    int fd = open(argv[1], O_RDONLY, 0);
    parseit(fd);
  }
}
