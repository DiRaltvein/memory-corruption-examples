// https://www.cvedetails.com/cve/CVE-2021-33797/
// repository: https://github.com/ccxvii/mujs
// commit: 292415b
// extract of: jsdtoa.c (function: js_strtod)

int main(int argc, char *argv[]) {
  if (argc < 2) {
    return 1;
  }
  char *string = argv[1];
  int exp = 0;
  while ((*string >= '0') && (*string <= '9')) {
    exp = exp * 10 + (*string - '0'); // Problem: number from command line can be greater then an 4 byte int can hold. If big enough number is given signed integer overflow can happen
    string += 1;
  }
}
