// https://www.cvedetails.com/cve/CVE-2023-46602/
// repository: https://github.com/InternationalColorConsortium/DemoIccMAX
// commit: 889db62
// extract of: IccXML/IccLibXML/IccUtilXml.cpp (function: icFixXml)

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

// copy of the original function that has a problem.
// It does not check for the length of the m_ptr and wheather szDest is long enough
// to contain all the text from szStr as well as substitutes.
const char *icFixXml(char *szDest, const char *szStr) {
  char *m_ptr = szDest;

  while (*szStr) {
    switch (*szStr) {
    case '\'':
      strcpy(m_ptr, "&apos;");
      m_ptr += 6;
      break;
    case '&':
      strcpy(m_ptr, "&amp;");
      m_ptr += 5;
      break;
    case '\"':
      strcpy(m_ptr, "&quot;");
      m_ptr += 6;
      break;
    case '<':
      strcpy(m_ptr, "&lt;");
      m_ptr += 4;
      break;
    case '>':
      strcpy(m_ptr, "&gt;");
      m_ptr += 4;
      break;
    default:
      *m_ptr++ = *szStr;
    }
    szStr++;
  }
  *m_ptr = '\0';

  return szDest;
}

int main() {
  char* randomString = getRandomString(5, 220);
  char fix[256];
  icFixXml(fix, randomString);
  printf("Fixed string: %s\n", fix);
  free(randomString);
}
