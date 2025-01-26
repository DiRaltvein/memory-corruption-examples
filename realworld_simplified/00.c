// <cvedetails url>
// repository: <repository url>
// commit: <commit hash where vulnerability exists>
// extract of: <path from project root to file with vulnerability> (function: <function name with vulnerability>)

#include <stdio.h>
#include <stdlib.h>

void printFileAsHexArray(const char *filename) {
  FILE *file = fopen(filename, "rb");
  if (file == NULL) {
    perror("Failed to open file");
    exit(1);
  }

  printf("unsigned char data[] = {");

  int byte;
  int first = 1;
  while ((byte = fgetc(file)) != EOF) {
    if (!first) {
      printf(", ");
    }
    printf("0x%02X", (unsigned char)byte);
    first = 0;
  }

  printf("};\n");

  fclose(file);
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    return 1;
  }

  printFileAsHexArray(argv[1]);

  return 0;
}
