// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-25564/
// repository: https://github.com/gssapi/gss-ntlmssp
// commit: 97c62c6
// extract of: src/ntlm.c (function: ntlm_decode_u16l_str_hdr)

#include <iconv.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

#define discard_const(ptr) ((void *)((uintptr_t)(ptr)))
#define safefree(x) \
  do {              \
    free(x);        \
    x = NULL;       \
  } while (0)

struct ntlm_ctx {
  iconv_t from_oem;
  iconv_t to_oem;
};

struct ntlm_buffer {
  uint8_t *data;
  size_t length;
};

struct wire_field_hdr {
  uint16_t len;
  uint32_t offset;
};

int ntlm_init_ctx(struct ntlm_ctx **ctx) {
  struct ntlm_ctx *_ctx;
  int ret = 0;

  _ctx = calloc(1, sizeof(struct ntlm_ctx));
  if (!_ctx) {
    return 1;
  }

  _ctx->from_oem = iconv_open("UTF16LE", "UTF-8");
  if (_ctx->from_oem == (iconv_t)-1) {
    ret = 1;
  }

  _ctx->to_oem = iconv_open("UTF-8", "UTF16LE");
  if (_ctx->to_oem == (iconv_t)-1) {
    iconv_close(_ctx->from_oem);
    ret = 1;
  }

  if (ret) {
    safefree(_ctx);
  } else {
    *ctx = _ctx;
  }
  return ret;
}

static int ntlm_str_convert(iconv_t cd,
                            const char *in, char *out,
                            size_t baselen, size_t *outlen) {
  char *_in;
  size_t inleft, outleft;
  size_t ret;

  ret = iconv(cd, NULL, NULL, NULL, NULL);
  if (ret == -1) {
    return 1;
  }

  _in = discard_const(in);
  inleft = baselen;
  /* conservative max_size calculation in case lots of octects end up
   * being multiple bytes in length (in both directions) */
  outleft = baselen * 2;

  ret = iconv(cd, &_in, &inleft, &out, &outleft);
  if (ret == -1) {
    return 1;
  }

  if (outlen) {
    *outlen = baselen * 2 - outleft;
  }
  return 0;
}

static int ntlm_decode_u16l_str_hdr(struct ntlm_ctx *ctx,
                                    struct wire_field_hdr *str_hdr,
                                    struct ntlm_buffer *buffer, char **str) {
  char *in, *out = NULL;
  uint16_t str_len;
  uint32_t str_offs;
  size_t outlen;
  int ret = 0;

  str_len = str_hdr->len;
  if (str_len == 0)
    goto done;

  str_offs = str_hdr->offset;
  if ((str_offs > buffer->length) ||
      (UINT32_MAX - str_offs < str_len) ||
      (str_offs + str_len > buffer->length)) {
    return 1;
  }

  in = (char *)&buffer->data[str_offs];

  out = malloc(str_len * 2 + 1);
  if (!out) {
    return 1;
  }

  ret = ntlm_str_convert(ctx->to_oem, in, out, str_len, &outlen);

  /* make sure to terminate output string */
  out[outlen] = '\0'; // Problem: if ntlm_str_convert fails for any reason than outlen will not be initialized. Accessing buffer out with an uninitialized value may lead to buffer overflow

done:
  if (ret) {
    safefree(out);
  }
  *str = out;
  return ret;
}

int main() {
  // char data[] = "Some valid string that ends with characters that make iconv output an error \xff\xff\xff";
  // size_t dataLen = strlen(data);

  int dataLen = getNumberInRange(50, 5000);
  uint8_t *data = (uint8_t *)getRandomByteStream(dataLen);

  struct ntlm_ctx *ctx;
  if (ntlm_init_ctx(&ctx)) {
    printf("Could not initialize context\n");
    free(data);
    return 1;
  }

  struct wire_field_hdr str_hdr = {
      .offset = 0,
      .len = dataLen};

  struct ntlm_buffer buffer = {
      .data = (uint8_t *)data,
      .length = dataLen};

  char *result;

  if (!ntlm_decode_u16l_str_hdr(ctx, &str_hdr, &buffer, &result)) {
    printf("Result: %s\n", result);
    free(result);
  }

  iconv_close(ctx->from_oem);
  iconv_close(ctx->to_oem);
  free(ctx);
  free(data);
}
