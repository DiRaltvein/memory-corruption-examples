// https://www.cvedetails.com/cve/CVE-2023-2617/
// repository: https://github.com/opencv/opencv_contrib
// commit: <commit hash where vulnerability exists>
// extract of: modules/wechat_qrcode/src/zxing/qrcode/decoder/decoded_bit_stream_parser.cpp (function: decodeByteSegment)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  int available = argc - 1;

  char *bytes_ = (char *)malloc(sizeof(char) * available);
  if (bytes_ == NULL) {
    return -1;
  }

  memset(bytes_, 'a', available);

  char *readBytes = &(bytes_)[0];

  // Problem: if available is 0 then malloc returns either NULL pointer or a pointer to memory that is allocated 0 bytes.
  // Code executes further only if pointer returned is not NULL so dereferencing of variable readBytes could potentially result in a read out of bound
  printf("%c\n", *readBytes);

  free(bytes_);
}
