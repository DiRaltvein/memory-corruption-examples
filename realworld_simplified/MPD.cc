// https://www.cvedetails.com/cve/CVE-2022-46449/
// repository: https://github.com/MusicPlayerDaemon/MPD
// commit: c2d0f35
// extract of: src/system/Error.hxx (function: FormatLastError)

#include <stdio.h>

int main() {
  char buffer[16];
  size_t length = snprintf(buffer, sizeof(buffer), "%s", "Sunsets are gold");
  *(buffer + length) = ':'; // Problem: write out of bound by one byte
}
