// https://www.cvedetails.com/cve/CVE-2023-3012/
// repository: https://github.com/gpac/gpac
// commit: 8f3088b
// extract of: src/utils/xml_parser.c (function: xml_sax_append_string)

#include <string.h>

int xml_sax_append_string(char *string) {
  size_t nl_size = strlen(string); // Problem: string may be a NULL pointer
  if (!nl_size)
    return -1;
  return 0;
}

int main(int argc, char *argv[]) {
  xml_sax_append_string(argv[1]);
}
