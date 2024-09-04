// https://www.cvedetails.com/cve/CVE-2020-36646/
// repository: https://github.com/MediaArea/ZenLib
// commit: 14b165e
// extract of: Source/ZenLib/Ztring.cpp (function: Date_From_Seconds_1970_Local)

#include <time.h>

int main(int argc, char *argv[]) {
  time_t Time = (time_t)argc;
  struct tm *Gmt = localtime(&Time);
  return Gmt->tm_year + 1900; // Problem: Gmt can be a Null pointer
}
