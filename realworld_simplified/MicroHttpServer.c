// https://www.cvedetails.com/cve/CVE-2023-50965/
// repository: https://github.com/starnight/MicroHttpServer
// commit: 4398570
// extract of: c-version/lib/middleware.c (function: _ReadStaticFiles)

#include <string.h>
#define STATIC_FILE_FOLDER "static/"

// the idea is that this is a function that returns files stored inside static folder of a web server
// when request comes extract file path and return the file. Default static directory is 'static/' and to that add
// the file path/name that is in the request
int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 0;
  }

  char path[128] = {STATIC_FILE_FOLDER};
  char *uri = argv[1]; // mock file name or path to retrieve

  memcpy(path + strlen(STATIC_FILE_FOLDER), uri, strlen(uri)); // Problem: lenght of uri is not checked and it can be larger then the buffer of 128 bytes.

  // following logic would be to open the file with path and return in if exists
  // fp = fopen(path, "r");
  // if(fp != NULL) {
  // ...
}
