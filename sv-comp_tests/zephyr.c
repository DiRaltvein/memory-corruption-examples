// https://www.cvedetails.com/cve/CVE-2023-4260/
// repository: https://github.com/zephyrproject-rtos/zephyr
// commit: 14d88c6
// extract of: subsys/fs/fuse_fs_access.c (function: fuse_fs_access_readdir)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "helpers.c"

#define PATH_MAX 4096

void fuse_fs_access_readdir(const char *path) {
  char mount_path[PATH_MAX];
  sprintf(mount_path, "%s//", path); // Problem: if path is PATH_MAX characters long (with null terminator) then it will be one byte overflow due to '/' character.
}

int main() {
  char *path = getRandomString(0, PATH_MAX);
  fuse_fs_access_readdir(path);
  free(path);
}
