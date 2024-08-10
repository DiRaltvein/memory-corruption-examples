// https://www.cvedetails.com/cve/CVE-2023-23108/
// repository: https://github.com/colinbourassa/crasm
// commit: 932f329
// extract of: src/pseudos.c (function: Xasc)

int main(int argc, char *argv[]) {
  char delimiter = *argv[1]; // Problem: potential null pointer dereference
  if (delimiter == '/')
    return 1;
}
