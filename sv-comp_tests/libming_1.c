// https://www.cvedetails.com/cve/CVE-2023-31976/
// repository: https://github.com/libming/libming
// commit: 04aee52
// extract of: libming/util/makeswf.c (function: makeswf_preprocess)

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

#define CPP "cpp -xc++ -P -Wall"
#define DEFSWFVERSION 6

static int swfversion = DEFSWFVERSION;
char *outputfile = "out.swf";

static void makeswf_preprocess(const char *file, const char *out) {
  char buf[128];
  sprintf(buf, "%s -D__SWF_VERSION__=%d %s > %s", CPP, swfversion, file, out); // Problem: potential buf overflow

  printf("Formatted buffer: %s\n", buf);
}

int main() {
  char *files[5];

  for (int i = 0; i < 5; i++) {
    files[i] = getRandomString(0, 150);
  }

  for (int i = 0; i < files; i++) {
    char ppfile[PATH_MAX];
    sprintf(ppfile, "%s.frame%d.pp", outputfile, i);
    makeswf_preprocess(files[i], ppfile);
    free(files[i]);
  }
}
