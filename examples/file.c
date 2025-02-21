#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(int argc, char ** argv) {
  if (argc != 2) {
      printf("Usage: %s <input file>");
      return 1;
  }

  // Read the entire input file to memory:
  FILE * fp = fopen(argv[1], "rb");
  fseek(fp, 0, SEEK_END);
  size_t size = ftell(fp);
  fseek(fp, 0, SEEK_SET);
  uint8_t * buffer = malloc(size);
  fread(buffer, 1, size, fp);
  fclose(fp);
}
