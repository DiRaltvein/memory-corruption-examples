// https://www.cvedetails.com/cve/CVE-2023-27590/
// repository: https://github.com/rizinorg/rizin
// commit: e7eae14
// extract of: librz/reg/profile.c (function: gdb_to_rz_profile)

#include <stdio.h>

int main(int argc, char *argv[]) {
  char name[16];
  sscanf("someLongTextThatIsDefinitelyLongerThan15Characters", "%s", name);
}
