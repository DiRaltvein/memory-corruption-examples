// https://www.cvedetails.com/cve/CVE-2023-48107/
// repository: https://github.com/pmqs/minizip-ng
// commit: 97d8e65
// extract of: mz_os.c (function: mz_path_has_slash)

#include <string.h>

int mz_path_has_slash(const char *path) {
  int path_len = strlen(path);
  if (path[path_len - 1] != '\\' && path[path_len - 1] != '/') // Problem: in case path is an empty string 0 - 1 will result in access out of bound on index -1
    return 1;
  return 0;
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    return 1;
  }
  mz_path_has_slash(argv[1]);
}
