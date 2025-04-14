// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-45681/
// repository: https://github.com/nothings/stb
// commit: 5736b15
// extract of: stb_vorbis.c (function: start_decoder)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

typedef struct _stb_vorbis {
  unsigned char *stream;
  unsigned int stream_size;
  unsigned int currect_stream_position;
} vorb;


int get32_packet(vorb *f) {
  if (f->currect_stream_position + 3 >= f->stream_size) {
    return -1;
  }
  uint32_t x;
  x = f->stream[f->currect_stream_position++];
  x += f->stream[f->currect_stream_position++] << 8;
  x += f->stream[f->currect_stream_position++] << 16;
  x += (uint32_t)f->stream[f->currect_stream_position++] << 24;
  return x;
}

void *setup_malloc(int sz) {
  sz = (sz + 7) & ~7;
  return sz ? malloc(sz) : NULL;
}

void start_decoder(vorb *f) {
  int i = 0;
  char **comment_list = {0};
  int comment_list_length = get32_packet(f);

  if (comment_list_length == -1) {
    return;
  }

  if (comment_list_length > 0) {
    // Problem: blind trust into data read from a file (in test case read from a buffer)
    // sizeof(char *) * comment_list_length can overflow and lead to an unpredictable result
    comment_list = (char **)setup_malloc(sizeof(char *) * comment_list_length);
    if (comment_list == NULL) {
      printf("Out of memory\n");
      return;
    }
  }

  for (i = 0; i < comment_list_length; ++i) {
    int len = get32_packet(f);
    if (len > 0xffff || f->currect_stream_position + len - 1 >= f->stream_size) {
      printf("Not enough buffer to read comment number [%d]\n", i);
      goto cleanup;
    }
    // Problem: in case comment_list array is smaller than comment_list_length due to integer overflow comment_list[i] may result in an overflow
    comment_list[i] = (char *)setup_malloc(sizeof(char) * (len + 1));
    if (comment_list[i] == NULL) {
      printf("Out of memory\n");
      goto cleanup;
    }
    for (int j = 0; j < len; ++j) {
      comment_list[i][j] = f->stream[f->currect_stream_position++];
    }
    comment_list[i][len] = (char)'\0';
  }

  for (int i = 0; i < comment_list_length; ++i) {
    printf("Comment number [%d] content: %s\n", i, comment_list[i]);
  }

cleanup:
  if (comment_list) {
    for (int i2 = 0; i2 < i; i2++) {
      free(comment_list[i2]);
    }
    free(comment_list);
  }
}

int main() {
  // unsigned char fileMock[] = {
  //     0x01, 0x00, 0x00, 0x40,                                                                               // number of comments overall. Currently set to 1073741825 to cause an integer overflow. Set to 9 to see the program working correctly
  //     0x0B, 0x00, 0x00, 0x00, 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x3d, 0x57, 0x6f, 0x72, 0x6c, 0x64,             // a single comment (first 4 bytes show comment length)
  //     0x0D, 0x00, 0x00, 0x00, 0x63, 0x68, 0x61, 0x72, 0x3d, 0x6f, 0x6e, 0x65, 0x20, 0x62, 0x79, 0x74, 0x65, // second comment
  //     0x01, 0x00, 0x00, 0x00, 0x61,                                                                         // third comment
  //     0x01, 0x00, 0x00, 0x00, 0x61,                                                                         // ...
  //     0x01, 0x00, 0x00, 0x00, 0x61,
  //     0x01, 0x00, 0x00, 0x00, 0x61,
  //     0x01, 0x00, 0x00, 0x00, 0x61,
  //     0x01, 0x00, 0x00, 0x00, 0x61,
  //     0x01, 0x00, 0x00, 0x00, 0x61}; // comment which causes overflow
  vorb f = {0};
  f.stream_size = getNumberInRange(5, 500);
  f.stream = getRandomByteStream(f.stream_size);
  f.currect_stream_position = 0;

  start_decoder(&f);
  free(f.stream);
}
