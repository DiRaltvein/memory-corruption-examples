// <cvedetails url>
// repository: <repository url>
// commit: <commit hash where vulnerability exists>
// extract of: <path from project root to file with vulnerability> (function: <function name with vulnerability>)

#include <stdlib.h>
#include <string.h>

typedef struct {
  char *str;
  int len;
} xh_string;

typedef struct {
  xh_string key, val;
} xh_pair;

typedef struct {
  xh_pair *list;
  int count;
} xh_table;

typedef struct {
  xh_table headers;
} xh_request;

typedef struct {
  xh_request public;
} xh_request2;

typedef struct {
  xh_request2 request;
} conn_t;

void parse(xh_request *req) {
  xh_table headers = {.list = NULL, .count = 0};
  headers.list = malloc(10 * sizeof(xh_pair));
  req->headers = headers;
  free(headers.list);
}

void when_data_is_ready_to_be_read(conn_t *conn) {
  parse(&conn->request.public);
}

void close_connection(conn_t *conn) {
  if (conn->request.public.headers.list != NULL)
    free(conn->request.public.headers.list); // Problem: potential double free if list was freed in parse function
}

int main(int argc, char *argv[]) {
  conn_t conn = {0};
  when_data_is_ready_to_be_read(&conn);
  close_connection(&conn);
}
