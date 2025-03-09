// https://www.cvedetails.com/cve/CVE-2023-4260/
// repository: https://github.com/zephyrproject-rtos/zephyr
// commit: 14d88c6
// extract of: subsys/fs/fuse_fs_access.c (function: fuse_fs_access_readdir)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define PATH_MAX 4096

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }

  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}


void fuse_fs_access_readdir(const char *path) {
  char mount_path[PATH_MAX];
  sprintf(mount_path, "%s//", path); // Problem: if path is PATH_MAX characters long (with null terminator) then it will be one byte overflow due to '/' character.
}

int main() {
  char *path = getRandomString(0, PATH_MAX);
  fuse_fs_access_readdir(path);
  free(path);
}
