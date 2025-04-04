// https://www.cvedetails.com/cve/CVE-2022-38072/
// repository: https://github.com/admesh/admesh
// commit: 767a105
// extract of: src/normals.c (function: stl_fix_normal_directions)

#include <stdio.h>
#include <stdlib.h>

#define NUM 14

struct _numbers {
  int number;
  struct _numbers *next_number;
};

typedef struct _numbers numbers;

typedef struct {
  int number_of_numbers;
  numbers *numbers_start;
} numbers_file;

numbers_file *initializeStl() {
  numbers *lastNumber = NULL;
  numbers *preLastNumber = NULL;
  numbers_file *stl = (numbers_file *)malloc(sizeof(numbers_file));
  if (stl == NULL)
    exit(1);
  stl->numbers_start = (numbers *)malloc(sizeof(numbers));
  if (stl->numbers_start == NULL)
    exit(1);
  stl->number_of_numbers = NUM;
  stl->numbers_start[0].number = 1;
  lastNumber = stl->numbers_start;
  for (int i = 1; i < NUM; i++) {
    numbers *number = (numbers *)malloc(sizeof(numbers));
    if (number == NULL)
      exit(1);
    if (i == 1 || preLastNumber == NULL) {
      number->number = 1;
    } else {
      number->number = preLastNumber->number + lastNumber->number;
    }
    lastNumber->next_number = number;
    preLastNumber = lastNumber;
    lastNumber = number;
  }
  lastNumber->next_number = NULL;
  return stl;
}

int main() {
  numbers_file *stl = initializeStl();
  int i = 0;
  int *extractedNumbers = (int *)calloc(stl->number_of_numbers, sizeof(int));
  if (extractedNumbers == NULL)
    exit(1);
  numbers *currentNumber = stl->numbers_start;
  numbers *temp = currentNumber;

  for (;;) {
    extractedNumbers[i++] = currentNumber->number;

    if (currentNumber->next_number != NULL) {
      currentNumber = currentNumber->next_number;
      free(temp);
      temp = currentNumber;
    } else {
      free(temp);
      break;
    }
  }

  // for (int j; j < stl->number_of_numbers; j++) {
  //   printf("%d\n", extractedNumbers[j]);
  // }

  free(stl);
  free(extractedNumbers);
}
