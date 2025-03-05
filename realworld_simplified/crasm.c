// https://www.cvedetails.com/cve/CVE-2023-23108/
// repository: https://github.com/colinbourassa/crasm
// commit: 932f329
// extract of: src/pseudos.c (function: Xasc)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *Xasc(char *oper) {
  register char *s;
  register char r;
  register char delimiter;

  s = oper;
  delimiter = *s; // Problem: Potential dereference of null pointer
  size_t operLength = strlen(oper);

  size_t processedIndex = 0;
  char *processed = calloc(operLength + 1, sizeof(char));
  if (processed == NULL) {
    printf("Out of memory\n");
    exit(1);
  }

  if (delimiter != '\'' && delimiter != '\"') {
    printf("Bad operand syntax\n");
    exit(1);
  }

  // to original code '(s - oper) < operLength' condition has been added to prevent buffer overflow in case 2 delimetr in a string is not found
  while ((s - oper) < operLength && (r = *++s) != delimiter) {
    if (r == '\\') {
      switch (*++s) {
      case 't':
        r = '\t';
        break;

      case 'n':
        r = '\n';
        break;

      case 'r':
        r = '\r';
        break;

      case '0':
        r = 0;
        break;

      case '\'':
      case '\"':
      case '\\':
        r = *s;
        break;

      default:
        printf("Bad \\X character\n");
        exit(1);
      }
    }

    processed[processedIndex++] = r;
  }

  if ((s - oper) < operLength && *++s) {
    printf("syntax error\n");
    exit(1);
  }

  return processed;
}

int main() {
  char string[] = "Test string \n\t Some value";
  char *oper = strchr(string, '\''); // In case string does not have quote (') character NULL pointer is returned

  char *processed = Xasc(oper);
  printf("Processed string: %s\n", processed);
  free(processed);
}
