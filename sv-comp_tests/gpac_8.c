// https://www.cvedetails.com/cve/CVE-2022-47091/
// repository: https://github.com/gpac/gpac
// commit: 4876076
// extract of: src/filters/load_text.c (function: gf_text_process_sub)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

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

int main() {
  // char szLine[] = "{200}{500 Function processes subtitles in the .SUB format but it does not expect subtitle to be malformed. When looking for closing } it overflows";
  char* szLine = getRandomString(5, 500);
  int start, end;
  char szTime[20], szText[2048];
  u32 len = (u32)strlen(szLine);
  u32 i = 0;
  u32 j = 0;
  if (szLine[i] != '{') {
    printf("Bad SUB file");
    free(szLine);
    exit(1);
  }
  while (szLine[i + 1] && szLine[i + 1] != '}') {
    szTime[i] = szLine[i + 1];
    i++;
    if (i >= 19) {
      break;
    }
  }
  szTime[i] = 0;
  start = atoi(szTime);
  j = i + 2;
  i = 0;
  if (szLine[j] != '{') {
    printf("Bad SUB file");
    free(szLine);
    exit(1);
  }
  while (szLine[i + 1 + j] && szLine[i + 1 + j] != '}') {
    szTime[i] = szLine[i + 1 + j]; // Problem: when looking for second subtitle time the i is not bounded by an if statement that reuslts in szTime stack buffer overflow
    i++;
  }
  szTime[i] = 0;
  end = atoi(szTime);
  j += i + 2;

  if (start > end) {
    printf("Bad SUB file");
    free(szLine);
    exit(1);
  }

  for (i = j; i < len; i++) {
    if (szLine[i] == '|') {
      szText[i - j] = '\n';
    } else {
      szText[i - j] = szLine[i];
    }
  }

  szText[i - j] = 0;
  printf("Final subtitle - %s\n", szText);
  free(szLine);
}
