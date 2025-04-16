// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-46852/
// repository: https://github.com/memcached/memcached
// commit: bc11696
// extract of: proto_proxy.c (function: proxy_process_command)

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

#define PARSER_MAX_TOKENS 24
#define KEY_MAX_LENGTH 250
#define VALUE_MAX_LENGTH 1024

typedef struct key_value {
  char key[KEY_MAX_LENGTH];
  char value[VALUE_MAX_LENGTH];
} key_value;

typedef struct mcp_parser_s {
  const char *request;
  uint8_t ntokens;
  uint8_t keytoken; // index in token array where cache key starts (cache key like 'mock')
  uint32_t parsed;
  uint32_t reqlen;
  int vlen;
  uint32_t klen;
  uint16_t tokens[PARSER_MAX_TOKENS]; // holds indexes of all tokens
  bool has_space;
} mcp_parser_t;

const key_value mockCache[] = {
    {"mock", "value1"},
    {"cache", "value2"},
    {"to", "value3"},
    {"test", "value4"},
};

const char *findValueByKey(const char *key) {
  size_t cacheSize = sizeof(mockCache) / sizeof(mockCache[0]);

  for (size_t i = 0; i < cacheSize; i++) {
    if (strcmp(mockCache[i].key, key) == 0) {
      return mockCache[i].value;
    }
  }

  return NULL;
}

size_t _process_request_next_key(mcp_parser_t *pr) {
  const char *cur = pr->request + pr->parsed;
  int remain = pr->reqlen - pr->parsed - 2;

  // chew off any leading whitespace.
  while (remain) {
    if (*cur == ' ') {
      remain--;
      cur++;
      pr->parsed++;
    } else {
      break;
    }
  }

  const char *s = memchr(cur, ' ', remain);
  if (s != NULL) {
    pr->klen = s - cur;
    pr->parsed += s - cur;
  } else {
    pr->klen = remain;
    pr->parsed += remain;
  }

  return cur - pr->request;
}

int _process_tokenize(mcp_parser_t *pr, const size_t max) {
  const char *s = pr->request;
  int len = pr->reqlen - 2;

  const char *end = s + len;
  int curtoken = 0;

  int state = 0;
  while (s != end) {
    switch (state) {
    case 0:
      // scanning for first non-space to find a token.
      if (*s != ' ') {
        pr->tokens[curtoken] = s - pr->request;
        if (++curtoken == max) {
          s++;
          state = 2;
          break;
        }
        state = 1;
      }
      s++;
      break;
    case 1:
      // advance over a token
      if (*s != ' ') {
        s++;
      } else {
        state = 0;
      }
      break;
    case 2:
      // hit max tokens before end of the line.
      // keep advancing so we can place endcap token.
      if (*s == ' ') {
        goto endloop;
      }
      s++;
      break;
    }
  }
endloop:

  // endcap token so we can quickly find the length of any token by looking
  // at the next one.
  pr->tokens[curtoken] = s - pr->request;
  pr->ntokens = curtoken;

  return 0;
}

int _process_token_len(mcp_parser_t *pr, size_t token) {
  const char *s = pr->request + pr->tokens[token];
  const char *e = pr->request + pr->tokens[token + 1];
  // start of next token is after any space delimiters, so back those out.
  while (*(e - 1) == ' ') {
    e--;
  }
  return e - s;
}

int _process_request_key(mcp_parser_t *pr) {
  pr->klen = _process_token_len(pr, pr->keytoken);
  // advance the parser in case of multikey.
  pr->parsed = pr->tokens[pr->keytoken] + pr->klen + 1;

  if (pr->request[pr->parsed - 1] == ' ') {
    pr->has_space = true;
  } else {
    pr->has_space = false;
  }
  return 0;
}

int process_request(mcp_parser_t *pr, const char *command, size_t cmdlen) {
  size_t cl = 0;

  // min command length is 2, plus the "\r\n"
  if (cmdlen < 4) {
    return -1;
  }

  const char *s = memchr(command, ' ', cmdlen - 2);
  if (s != NULL) {
    cl = s - command;
  } else {
    cl = cmdlen - 2;
  }
  pr->keytoken = 0;
  pr->has_space = false;
  pr->parsed = cl + 1;
  pr->request = command;
  pr->reqlen = cmdlen;
  int token_max = 2;

  if (cl != 3) {
    // cl just shows length of first keyword of a command
    // this test case only operates on get so if command is not 3 characters long then something is wrong
    return 1;
  }

  _process_tokenize(pr, token_max);

  if (pr->ntokens < token_max) {
    printf("not enough tokens for simple request: %d\n", pr->ntokens);
    return -1;
  }

  pr->keytoken = 1;
  _process_request_key(pr);

  return 0;
}

int proxy_process_command(char *command, size_t cmdlen, bool multiget) {
  mcp_parser_t pr = {0};

  int ret = process_request(&pr, command, cmdlen);
  if (ret != 0) {
    return 1;
  }

  if (!multiget && pr.has_space) {
    uint32_t keyoff = pr.tokens[pr.keytoken];
    while (pr.klen != 0) {
      char temp[KEY_MAX_LENGTH + 30] = {0};
      char *cur = temp;
      if (pr.klen > KEY_MAX_LENGTH) {
        return 1;
      } else {
        // copy original request up until the original key token.
        memcpy(cur, pr.request, pr.tokens[pr.keytoken]); // Problem pr.tokens[pr.keytoken] (or in other words index where first cache key starts) can be greater than KEY_MAX_LENGTH + 30 causing buffer overflow
        cur += pr.tokens[pr.keytoken];

        // now copy in our "current" key.
        memcpy(cur, &pr.request[keyoff], pr.klen); // This is validated that pr.klen is smaller than KEY_MAX_LENGTH but the problem is that pr.tokens[pr.keytoken] can be greater than 30 and 40 thus overflowing the temp buffer
        cur += pr.klen;

        memcpy(cur, "\r\n", 2);
        cur += 2;

        proxy_process_command(temp, cur - temp, true);
      }
      keyoff = _process_request_next_key(&pr);
    }

    return 0;
  }

  char *key = calloc(pr.klen + 1, sizeof(char));
  if (key == NULL) {
    printf("Out of memory!\n");
    return 1;
  }
  memcpy(key, &pr.request[pr.tokens[pr.keytoken]], pr.klen);

  char *value = findValueByKey(key);
  if (value) {
    printf("Value that corresponds to key [%s] is: %s\n", key, value);
  } else {
    printf("Could not find a value in cache that would correspond to key [%s]\n", key);
  }

  free(key);

  return 0;
}

// Program is a simple extracted logic that handles in memory cache
// command for example 'get mock cache' is parsed and values that are associated with keys 'mock' and 'cache' are returned in command line
// in get <key> is given when key does not exist then a message that key is not found is returned
// the whole logic is vulnerable if keytoken index is very far meaning that between command token and key token is a lot of spaces
int main() {
  // char command[] = "get                                                                                                    \
  //                                                                                                   \
  //                                                                                                   mock cache to test\n";
  char* command = getRandomString(50, 500);

  int ret = proxy_process_command(command, strlen(command), false);
  free(command);
  return ret;
}
