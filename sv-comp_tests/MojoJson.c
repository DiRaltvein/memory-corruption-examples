// https://www.cvedetails.com/cve/CVE-2023-23086/
// repository: https://github.com/scottcgi/MojoJson
// commit: be503f8
// extract of: Json.c (function: SkipString)

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

int SkipString(const char **jsonPtr, const char **outStrStart) {
  // skip '"'
  const char *json = ++(*jsonPtr);
  int count = 0;
  char c;

  // check end '"'
  while ((c = json[count++]) != '"') { // Problem: looking for a closing " to determine string bound but if there is no closing " provided then json[count++] buffer access will result in a buffer overflow
    if (c == '\\') {
      // skip escaped quotes
      // the escape char may be '\"'，which will break while
      ++count;
    }
  }

  *outStrStart = json;

  // already skipped the string end '"'
  *jsonPtr += count;

  // how many char skipped
  // count contains the string end '"', so -1
  return count - 1;
}

void ParseString(const char **jsonPtr) {
  if (*(*jsonPtr) != '"') {
    printf("String must be between double quotes and the first element must be thus a double quote\n");
    exit(1);
  }
  const char *strStart;
  int length = SkipString(jsonPtr, &strStart);
  char *string = calloc(length + 1, sizeof(char));
  if (!string) {
    printf("Out of memory!\n");
    exit(1);
  }
  memcpy(string, strStart, length);
  printf("%s\n", string);
  free(string);
}

// to break application pass any string as a first parametr that starts with " and where is no closing "
// for example \"123
int main() {
  char* randomString = getRandomString(5, 500);
  ParseString(&randomString);
  free(randomString);
}
