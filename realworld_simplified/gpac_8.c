// https://www.cvedetails.com/cve/CVE-2022-47091/
// repository: https://github.com/gpac/gpac
// commit: 4876076
// extract of: src/filters/load_text.c (function: gf_text_process_sub)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;

int main() {
  // if (argc < 2) {
  //   exit(0);
  // }
  // char *szLine = argv[1]; // when malicious input is not hardcoded than some static code analyzers can not find the overflow
  char szLine[] = "{200}{500 Function processes subtitles in the .SUB format but it does not expect subtitle to be malformed. When looking for closing } it overflows";
  int start, end;
  char szTime[20], szText[2048];
  u32 len = (u32)strlen(szLine);
  u32 i = 0;
  u32 j = 0;
  if (szLine[i] != '{') {
    printf("Bad SUB file");
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
    printf("Bad SUB file"); // when using hardcoded subtitle this if statement gets executed because overflow changes start value and it gets bigger than 200
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
}
