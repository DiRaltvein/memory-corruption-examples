// https://www.cvedetails.com/cve/CVE-2023-31568/
// repository: https://github.com/podofo/podofo
// commit: 882e729
// extract of: src/podofo/main/PdfEncrypt.cpp (function: PdfEncryptRC4)

#include <cstring>
#include <stdio.h>

int main(int argc, char *argv[]) {
  unsigned char m_oValue[48];
  std::memcpy(m_oValue, argv[0], 32); // Problem: if executable name is less than 32 bytes then memcpy will read out of bound because it does not respect string null terminator
}
