// https://www.cvedetails.com/cve/CVE-2023-48107/
// repository: https://github.com/pmqs/minizip-ng
// commit: 97d8e65
// extract of: mz_os.c (function: mz_path_has_slash)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MZ_PATH_SLASH_UNIX ('/')

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

int32_t mz_path_has_slash(const char *path) {
  int32_t path_len = (int32_t)strlen(path);
  if (path[path_len - 1] != '\\' && path[path_len - 1] != '/') // Problem: in case path is an empty string 0 - 1 will result in access out of bound on index -1
    return 1;
  return 0;
}

// function is preserved only to make is a little bit harder for code analyzers to detect vulnerability
// function itself is not vulnerable and is not needed to produce vulnerability
int32_t mz_path_convert_slashes(char *path, char slash) {
  int32_t i = 0;

  for (i = 0; i < (int32_t)strlen(path); i += 1) {
    if (path[i] == '\\' || path[i] == '/')
      path[i] = slash;
  }
  return 0;
}

int main() {
  // if (argc < 2) {
  //   printf("Usage %s <file system path>\n", argv[0]);
  //   return 1;
  // }
  // const char *path = argv[1];
  // size_t path_length = strlen(path);

  const char *path = getRandomString(0, 500);
  size_t path_length = strlen(path);

  char *pathwfs = (char *)calloc(path_length + 1, sizeof(char));
  if (pathwfs == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  strncat(pathwfs, path, path_length);

  mz_path_convert_slashes(pathwfs, MZ_PATH_SLASH_UNIX);
  if (mz_path_has_slash(pathwfs) == 0) {
    printf("provided path has a slash at the end\n");
  } else {
    printf("provided path does not have a slash at the end\n");
  }
  free(pathwfs);
}
