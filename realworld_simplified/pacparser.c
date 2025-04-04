// https://www.cvedetails.com/cve/CVE-2019-25078/
// repository: https://github.com/manugarg/pacparser
// commit: f013613
// extract of: src/pacparser.c (function: pacparser_find_proxy)

#include <stdlib.h>
#include <string.h>

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
  char url[] = "and I''''''''' am url";
  // URL-encode "'" as we use single quotes to stick the URL into a temporary script.
  char *sanitized_url = str_replace(url, "'", "%27");

  char *script = (char *)malloc(32 + strlen(url));
  script[0] = '\0';
  strcat(script, "findProxyForURL('");
  strcat(script, sanitized_url); // Problem: memory of script is allocated considering length of variable 'url' but variable 'sanitized_url' longer can be greater then of url variable due to str_replace.
  strcat(script, "', '");
  strcat(script, "')");
  free(script);
  free(sanitized_url);
}
