// https://www.cvedetails.com/cve/CVE-2023-33457/
// repository: https://github.com/sogou/workflow
// commit: 1601c8b
// extract of: src/util/URIParser.cc (function: parse)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  char *scheme;
  char *userinfo;
  char *host;
  char *port;
  char *path;
  char *query;
  char *fragment;
} ParsedURI;

enum {
  URI_SCHEME,
  URI_USERINFO,
  URI_HOST,
  URI_PORT,
  URI_QUERY,
  URI_FRAGMENT,
  URI_PATH,
  URI_PART_ELEMENTS,
};

static unsigned char authority_map[256] = {
	URI_PART_ELEMENTS, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, URI_FRAGMENT, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, URI_PATH,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, URI_HOST, 0, 0, 0, 0, URI_QUERY,
	URI_USERINFO, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
};

// program parses url's into different segments.
// url must be provided as a argument to the program
// most url's are parsed correctly, like 'https://www.youtube.com/watch?v=fNFzfwLM72c'
// example of malicious input '1://['

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return 1;
  }
  ParsedURI uri = {0};
  const char *str = argv[1]; // example of malicious input '1://['

  int start_idx[URI_PART_ELEMENTS] = {0};
  int end_idx[URI_PART_ELEMENTS] = {0};
  int pre_state = URI_SCHEME;
  int i;
  bool in_ipv6 = false;

  for (i = 0; str[i]; i++) {
    if (str[i] == ':') {
      end_idx[URI_SCHEME] = i++;
      break;
    }
  }

  if (end_idx[URI_SCHEME] == 0)
    return -1;

  if (str[i] == '/' && str[i + 1] == '/') {
    pre_state = URI_HOST;
    i += 2;
    if (str[i] == '[')
      in_ipv6 = true;
    else
      start_idx[URI_USERINFO] = i;

    start_idx[URI_HOST] = i;
  } else {
    pre_state = URI_PATH;
    start_idx[URI_PATH] = i;
  }

  bool skip_path = false;
  if (start_idx[URI_PATH] == 0) {
    for (;; i++) {
      switch (authority_map[(unsigned char)str[i]]) {
      case 0:
        continue;

      case URI_USERINFO:
        if (str[i + 1] == '[')
          in_ipv6 = true;

        end_idx[URI_USERINFO] = i;
        start_idx[URI_HOST] = i + 1;
        pre_state = URI_HOST;
        continue;

      case URI_HOST:
        if (str[i - 1] == ']')
          in_ipv6 = false;

        if (!in_ipv6) {
          end_idx[URI_HOST] = i;
          start_idx[URI_PORT] = i + 1;
          pre_state = URI_PORT;
        }
        continue;

      case URI_QUERY:
        end_idx[pre_state] = i;
        start_idx[URI_QUERY] = i + 1;
        pre_state = URI_QUERY;
        skip_path = true;
        continue;

      case URI_FRAGMENT:
        end_idx[pre_state] = i;
        start_idx[URI_FRAGMENT] = i + 1;
        end_idx[URI_FRAGMENT] = i + strlen(str + i);
        pre_state = URI_PART_ELEMENTS;
        skip_path = true;
        break;

      case URI_PATH:
        if (skip_path)
          continue;

        start_idx[URI_PATH] = i;
        break;

      case URI_PART_ELEMENTS:
        skip_path = true;
        break;
      }

      break;
    }
  }
  if (pre_state != URI_PART_ELEMENTS)
    end_idx[pre_state] = i;

  if (!skip_path) {
    pre_state = URI_PATH;
    for (; str[i]; i++) {
      if (str[i] == '?') {
        end_idx[URI_PATH] = i;
        start_idx[URI_QUERY] = i + 1;
        pre_state = URI_QUERY;
        while (str[i + 1]) {
          if (str[++i] == '#')
            break;
        }
      }

      if (str[i] == '#') {
        end_idx[pre_state] = i;
        start_idx[URI_FRAGMENT] = i + 1;
        pre_state = URI_FRAGMENT;
        break;
      }
    }
    end_idx[pre_state] = i + strlen(str + i);
  }

  char **dst[URI_PART_ELEMENTS] = {&uri.scheme, &uri.userinfo, &uri.host, &uri.port,
                                   &uri.query, &uri.fragment, &uri.path};

  for (int i = 0; i < URI_PART_ELEMENTS; i++) {
    if (end_idx[i] > start_idx[i]) {
      size_t len = end_idx[i] - start_idx[i];

      *dst[i] = (char *)calloc(len + 1, sizeof(char));
      if (*dst[i] == NULL) {
        continue;
      }

      if (i == URI_HOST && str[start_idx[i]] == '[') {
        len -= 2;
        memcpy(*dst[i], str + start_idx[i] + 1, len); // Problem: if len of URI segment is 1 and 2 is subtracted len becomes extremly big
      } else
        memcpy(*dst[i], str + start_idx[i], len);
      (*dst[i])[len] = '\0';
    }
  }

  // just print uri components to the cli back to the user
  for (int i = 0; i < URI_PART_ELEMENTS; i++) {
    if (i == 0) {
      printf("URI_SCHEME: ");
    } else if (i == 1) {
      printf("URI_USERINFO: ");
    } else if (i == 2) {
      printf("URI_HOST: ");
    } else if (i == 3) {
      printf("URI_PORT: ");
    } else if (i == 4) {
      printf("URI_QUERY: ");
    } else if (i == 5) {
      printf("URI_FRAGMENT: ");
    } else if (i == 6) {
      printf("URI_PATH: ");
    } else {
      printf("URI_PART_ELEMENTS: ");
    }

    if (*dst[i] != NULL) {
      printf("%s\n", *dst[i]);
      free(*dst[i]);
    } else {
      printf("-\n");
    }
  }
}
