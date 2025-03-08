// https://www.cvedetails.com/cve/CVE-2022-46449/
// repository: https://github.com/MusicPlayerDaemon/MPD
// commit: c2d0f35
// extract of: src/system/Error.hxx (function: FormatLastError)

#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc < 2) {
    return 1;
  }

  char buffer[60];
  // the problem is  that snprintf returns 'the number of characters that would have been written if n had been sufficiently large'
  // as per https://cplusplus.com/reference/cstdio/snprintf/
  // So if string to write into buffer is longer than 30 (50 - 20) bytes then nothing is written into buffer and the length of the string is returned
	size_t length = snprintf(buffer, sizeof(buffer) - 20, "Your privided string: %s", argv[1]);
	char *p = buffer + length;
	*p++ = ':'; // Problem: write out of bound by one byte
	*p++ = ' '; // Problem: write out of bound by one byte

  printf("%s\n", buffer);
}
