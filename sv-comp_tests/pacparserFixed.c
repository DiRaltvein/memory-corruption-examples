// https://www.cvedetails.com/cve/CVE-2019-25078/
// repository: https://github.com/manugarg/pacparser
// commit: f013613
// extract of: src/pacparser.c (function: pacparser_find_proxy)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

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

char *str_replace(const char *orig, char *rep, char *with) {
  char *result;  // the return string
  char *ins;     // the next insert point
  char *tmp;     // varies
  int count;     // number of replacements
  int len_front; // distance between rep and end of last rep
  int len_rep = strlen(rep);
  int len_with = strlen(with);

  // Get the count of replacements
  ins = orig;
  for (count = 0; (tmp = strstr(ins, rep)); ++count) {
    ins = tmp + len_rep;
  }

  tmp = result = malloc(strlen(orig) + (len_with - len_rep) * count + 1);

  // first time through the loop, all the variable are set correctly
  // from here on,
  //    tmp points to the end of the result string
  //    ins points to the next occurrence of rep in orig
  //    orig points to the remainder of orig after "end of rep"
  while (count--) {
    ins = strstr(orig, rep);
    len_front = ins - orig;
    tmp = strncpy(tmp, orig, len_front) + len_front;
    tmp = strcpy(tmp, with) + len_with;
    orig += len_front + len_rep; // move to next "end of rep"
  }

  // Copy the remaining string.
  strcpy(tmp, orig);
  return result;
}

int main() {
  char* url = getRandomString(5, 500);
  // URL-encode "'" as we use single quotes to stick the URL into a temporary script.
  char *sanitized_url = str_replace(url, "'", "%27");

  char *script = (char *)malloc(32 + strlen(sanitized_url));
  script[0] = '\0';
  strcat(script, "findProxyForURL('");
  strcat(script, sanitized_url);
  strcat(script, "', '");
  strcat(script, "')");
  free(script);
  free(sanitized_url);
  free(url);
}
