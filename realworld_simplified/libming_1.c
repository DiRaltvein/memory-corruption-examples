// https://www.cvedetails.com/cve/CVE-2023-31976/
// repository: https://github.com/libming/libming
// commit: 04aee52
// extract of: libming/util/makeswf.c (function: makeswf_preprocess)

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

#define CPP "cpp -xc++ -P -Wall"
#define DEFSWFVERSION 6

static int swfversion = DEFSWFVERSION;
char *outputfile = "out.swf";

static void makeswf_preprocess(const char *file, const char *out) {
  char buf[128];
  sprintf(buf, "%s -D__SWF_VERSION__=%d %s > %s", CPP, swfversion, file, out); // Problem: potential buf overflow

  printf("Formatted buffer: %s\n", buf);
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: %s <filename1> <filename2> ...\n", argv[0]);
    return 1;
  }

  for (int i = 1; i < argc; i++) {
    char *filename = argv[i];
    char ppfile[PATH_MAX];
    sprintf(ppfile, "%s.frame%d.pp", outputfile, i);
    makeswf_preprocess(filename, ppfile);
  }
}
