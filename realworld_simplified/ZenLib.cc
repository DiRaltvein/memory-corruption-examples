// https://www.cvedetails.com/cve/CVE-2020-36646/
// repository: https://github.com/MediaArea/ZenLib
// commit: 14b165e
// extract of: Source/ZenLib/Ztring.cpp (function: Date_From_Seconds_1970_Local)

#include <time.h>

int main(int argc, char *argv[]) {
  time_t Time = (time_t)argv[1];
  struct tm Gmt_Temp;
  struct tm *Gmt = localtime_r(&Time, &Gmt_Temp);
  return Gmt->tm_year + 1900; // Problem: Gmt can be a Null pointer
}
