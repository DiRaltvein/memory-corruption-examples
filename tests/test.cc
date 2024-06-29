
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void array_out_of_bound() {
  int numbers[] = {10, 25};
  numbers[2] = 50;
}

void overflow() {
  char buff[11];
  strcpy(buff, "Hello World!"); // 13 characters (including null terminator) are put insize buffer with length 11.
}

void use_after_free() {
  int *value = (int *)malloc(sizeof(int));
  free(value);
  *value = 1;
}

void use_before_init() {
  int *value;
  printf("%i", *value);
}

int main(int argc, char *argv[]) {
  array_out_of_bound();
  overflow();
  use_after_free();
  use_before_init();
}
