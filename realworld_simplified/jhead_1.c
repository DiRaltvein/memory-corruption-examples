// https://www.cvedetails.com/cve/CVE-2020-28840/
// repository: https://github.com/Matthias-Wandel/jhead
// commit: e64e904
// extract of: jpgfile.c (function: process_COM)

#include <stdio.h> // printf
#include <string.h>

#define MAX_COMMENT_SIZE 32

int main(int argc, char *argv[]) {
  if (argc < 2)
    return 1;
  char *Data = argv[1]; // take a string from command prompt
  int length = strlen(Data);

  char Comment[MAX_COMMENT_SIZE + 1];
  int nch;

  nch = 0;

  if (length > MAX_COMMENT_SIZE)
    length = MAX_COMMENT_SIZE;

  for (int a = 0; a < length; a++) {
    int ch = Data[a];

    if (ch == 'a' && Data[a + 1] == 'a') // Problem: in case a is the last character in a string then Data[a+1] will result in a one byte read past end of the string
      continue;

    Comment[nch++] = (char)ch;
  }

  Comment[nch] = '\0';

  printf("COM marker comment: %s\n", Comment);
}
