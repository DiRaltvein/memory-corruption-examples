// https://www.cvedetails.com/cve/CVE-2023-49287/
// repository: https://github.com/cxong/tinydir
// commit: 74acffd
// extract of: tinydir.h (function: tinydir_file_open)

#include <string.h>

#define _TINYDIR_PATH_MAX 4096
#define _TINYDIR_FILENAME_MAX 256

int main(int argc, char *argv[]) {
  if (argc < 2) {
    return -1;
  }

  const char *path = argv[1];
  if (path == NULL || strlen(path) == 0 || strlen(path) >= _TINYDIR_PATH_MAX) {
    return -1;
  }

  char file_name_buf[_TINYDIR_FILENAME_MAX];

  strcpy(file_name_buf, path); // Problem: path may be longer then the file_name_buf length
}
