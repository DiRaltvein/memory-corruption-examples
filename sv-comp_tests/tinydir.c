// https://www.cvedetails.com/cve/CVE-2023-49287/
// repository: https://github.com/cxong/tinydir
// commit: 74acffd
// extract of: tinydir.h (function: tinydir_file_open)

// Similar vulnerabilities:
// - https://www.cvedetails.com/cve/CVE-2023-50965/
// - https://www.cvedetails.com/cve/CVE-2021-46901/

#include <libgen.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

#define _TINYDIR_PATH_MAX 4096
#define _TINYDIR_FILENAME_MAX 256

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

int tinydir_file_open(const char *path) {
  char dir_name_buf[_TINYDIR_PATH_MAX];
  char file_name_buf[_TINYDIR_FILENAME_MAX];
  char *dir_name;
  char *base_name;

  if (path == NULL || strlen(path) == 0 || strlen(path) >= _TINYDIR_PATH_MAX) {
    return -1;
  }

  /* Get the parent path */
  strcpy(dir_name_buf, path);
  dir_name = dirname(dir_name_buf);
  strcpy(file_name_buf, path); // Problem path length can be greater than 256 leading to stack buffer oveflow of file_name_buf buffer
  base_name = basename(file_name_buf);
  if ((strcmp(base_name, "/")) == 0) {
    printf("Folder path provided: %s\n", dir_name);
  } else {
    printf("File path provided: %s\n", base_name);
  }

  return 0;
}

int main() {
  char* path = getRandomString(5, 500);
  if (tinydir_file_open(path) == -1) {
    printf("Error");
    return 1;
  }
  free(path);
}
