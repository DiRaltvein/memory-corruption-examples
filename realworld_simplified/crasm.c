// https://www.cvedetails.com/cve/CVE-2023-23108/
// repository: https://github.com/colinbourassa/crasm
// commit: 932f329
// extract of: src/pseudos.c (function: Xasc)

int Xasc(char *oper) {
  register char *s = oper;

  if (*s == '/') { // Potential dereference of NULL pointer
    return 1;
  }
  return 0;
}

int main(int argc, char *argv[]) {
  return Xasc(argv[1]); // potential read out of bound
}
