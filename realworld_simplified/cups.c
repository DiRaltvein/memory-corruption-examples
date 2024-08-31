// https://www.cvedetails.com/cve/CVE-2023-4504/
// repository: https://github.com/OpenPrinting/cups
// commit: 9d57699
// extract of: cups/raster-interpret.c (function: scan_ps)

int main() {
  char *cur = "(Hello\\";

  for (cur++; *cur; cur++) {
    if (*cur == '\\') {
      cur++; // Problem: after addition if cur pointer was already pointing to the last character in a string it will point to the null byte
      // it leads to reading outside of the string because in the end of for cycle cur pointer is once again incremented by the for loop
    }
  }
}
