// https://www.cvedetails.com/cve/CVE-2022-4899/
// repository: https://github.com/facebook/zstd
// commit: 1b445c1
// extract of: programs/util.c (function: mallocAndJoin2Dir)

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#define PATH_SEP '/'

char* mallocAndJoin2Dir(const char *dir1, const char *dir2)
{
  assert(dir1 != NULL && dir2 != NULL);

  const size_t dir1Size = strlen(dir1);
  const size_t dir2Size = strlen(dir2);
  char *outDirBuffer, *buffer, trailingChar;

  outDirBuffer = (char *) malloc(dir1Size + dir2Size + 2);
  if (outDirBuffer == NULL) {
    printf("Out of memory!\n");
    exit(1);
  }

  memcpy(outDirBuffer, dir1, dir1Size);
  outDirBuffer[dir1Size] = '\0';

  if (dir2[0] == '.')
      return outDirBuffer;

  buffer = outDirBuffer + dir1Size;
  trailingChar = *(buffer - 1); // Problem: in case dir1 is an empty string with length 0 buffer - 1 will result in a out of bound read
  if (trailingChar != PATH_SEP) {
      *buffer = PATH_SEP;
      buffer++;
  }
  memcpy(buffer, dir2, dir2Size);
  buffer[dir2Size] = '\0';

  return outDirBuffer;
}

// vulnerability can be triggered by: ./a.out '' some/random/dir/path
int main(int argc, char *argv[]) {
  if (argc < 3) {
    return 0;
  }

  char* joinedDirs = mallocAndJoin2Dir(argv[1], argv[2]);
  printf("%s\n", joinedDirs);
  free(joinedDirs);
}
