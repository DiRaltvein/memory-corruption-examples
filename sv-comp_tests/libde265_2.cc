// https://www.cvedetails.com/cve/CVE-2023-43887/
// repository: https://github.com/strukturag/libde265
// commit: 296503d
// extract of: libde265/pps.cc (function: dump)

#include <stdio.h>
#include <stdlib.h>

#define DE265_MAX_TILE_COLUMNS 10

extern int __VERIFIER_nondet_int(void);

typedef struct {
  int num_tile_columns;
  int colBd[DE265_MAX_TILE_COLUMNS];
} pic_parameter_set;

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

pic_parameter_set *initializePicParameterSetObject() {
  pic_parameter_set *obj = (pic_parameter_set *)malloc(sizeof(pic_parameter_set));
  obj->num_tile_columns = getNumberInRange(0, 15);

  for (int i = 0; i < DE265_MAX_TILE_COLUMNS; i++) {
    obj->colBd[i] = i;
  }

  return obj;
}

bool read(pic_parameter_set *obj) {
  int num_tile_columns = obj->num_tile_columns;
  if (num_tile_columns == -1 || num_tile_columns + 1 > DE265_MAX_TILE_COLUMNS) {
    return false;
  }

  int sum = 0;
  for (int i = 0; i < num_tile_columns; i++) {
    sum += obj->colBd[i];
  }
  printf("sum of all the numbers in colBd array is : %d\n", sum);

  return true;
}

int main() {

  pic_parameter_set *obj = initializePicParameterSetObject();
  bool error = read(obj);
  if (!error) {
    for (int i = 0; i <= obj->num_tile_columns; i++) {
      printf("%d\n", obj->colBd[i]); // Problem: heap buffer overflow. num_tile_columns is just random number in range [0, 15] and when it is greater than 10 then overflow happens
    }
    free(obj);
    return 1;
  }
  free(obj);
}
