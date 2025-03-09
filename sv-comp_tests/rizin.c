// https://www.cvedetails.com/cve/CVE-2023-27590/
// repository: https://github.com/rizinorg/rizin
// commit: e7eae14
// extract of: librz/reg/profile.c (function: gdb_to_rz_profile)

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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

static void gdb_to_rz_profile(const char *gdb) {
  char *ptr1;
  char name[16], groups[128], type[16];
  int ret, typei;

  const char *ptr = gdb;
  for (;;) {
    // Skip whitespace at beginning of line and empty lines
    while (isspace(*ptr)) {
      ptr++;
    }
    if (!*ptr) {
      break;
    }
    if ((ptr1 = strchr(ptr, '\n'))) {
      *ptr1 = '\0';
    } else {
      printf("Could not parse line: %s (missing \\n)\n", ptr);
      return;
    }
    ret = sscanf(ptr, " %s %d %s %s", name, &typei, type, groups); // Problem: sscanf may overflow name, groups or type buffer when reading from ptr
    if (ret < 4) {
      printf("Could not parse line: %s\n", ptr);
      ptr = ptr1 + 1;
      continue;
    }

    printf("Parsed values: ");
    printf("name: %s, ", name);
    printf("groups: %s, ", groups);
    printf("type: %s, ", type);
    printf("type as number: %d\n", typei);

    ptr = ptr1 + 1;
    continue;
  }
}

int main() {
  // char data[] = "rax 0  general all\n \
  //                xmm0 17 float sse\n \
  //                st0 33 SomeValueThatIsLongerThan16Bytes fpu\n";
  char* data = getRandomString(5, 1000);

  gdb_to_rz_profile(data);

  free(data);
}
