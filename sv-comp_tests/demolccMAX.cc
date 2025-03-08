// https://www.cvedetails.com/cve/CVE-2023-46602/
// repository: https://github.com/InternationalColorConsortium/DemoIccMAX
// commit: 889db62
// extract of: IccXML/IccLibXML/IccUtilXml.cpp (function: icFixXml)

#include <string.h>
#include <stdio.h>

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

int main(int argc, char *argv[]) {
  if (argc == 1)
    return 0;

  char fix[256];
  icFixXml(fix, argv[1]);
  printf("Fixed string: %s\n", fix);
}
