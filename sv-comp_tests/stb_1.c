// https://www.cvedetails.com/cve/CVE-2023-45664/
// repository: https://github.com/nothings/stb
// commit: 5736b15
// extract of: stb_image.h (function: stbi__load_gif_main)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int getNumberOfNumbersInAString(char *string) {
  int i = 0;
  char *numberAsString;
  char *duplicate = strdup(string);
  char *ptr = duplicate;
  while ((numberAsString = strsep(&ptr, ",")) != NULL) {
    if (atoi(numberAsString) == 0)
      continue;
    i++;
  }
  free(duplicate);
  return i;
}

int main(int argc, char *argv[]) {
  if (argc == 1) {
    printf("The program sums numbers given that are separated by a coma\n");
    printf("Example input could be 9,5,3,1,12,6 8,4,2,8,1 and the response would be 36 and 23\n");
    printf("Program limitations: Numbers only in range: [1, 255]\n");
    return 0;
  }
  unsigned char *out = NULL;
  for (int i = 1; i < argc; i++) {
    int NumberOfNumbers = getNumberOfNumbersInAString(argv[i]);
    if (!out) {
      out = calloc(NumberOfNumbers, sizeof(unsigned char));
      if (!out) {
        printf("out of memory\n");
        return 1;
      }
    } else {
      unsigned char *tmp = realloc(out, NumberOfNumbers); // 'clever' way to reuse the same buffer
      if (!tmp) {
        printf("out of memory\n");
        // Problem: in case realloc was given a size of 0 it may free pointer given to it and return a null pointer
        // such condition would result in a double free
        free(out);
        return 1;
      }
      out = tmp;
    }

    char *duplicate = strdup(argv[i]);
    char *ptr = duplicate;
    for (int j = 0; j < NumberOfNumbers; j++) {
      char *numberAsString = strsep(&ptr, ",");
      if (numberAsString == NULL) {
        printf("Undetermined error\n");
        exit(1);
      }
      int number = atoi(numberAsString);
      if (number > 255 || number < 1) {
        printf("Only numbers in range [1, 255] are allowed\n");
        exit(1);
      }
      out[j] = (unsigned char)number;
    }

    free(duplicate);

    int sum = 0;
    for (int j = 0; j < NumberOfNumbers; j++) {
      sum += out[j];
    }

    printf("Sum of string %s is %d\n", argv[i], sum);
  }

  if (out) {
    free(out);
  }
}
