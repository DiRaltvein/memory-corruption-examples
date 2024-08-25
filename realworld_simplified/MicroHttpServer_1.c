// https://www.cvedetails.com/cve/CVE-2023-51771/
// repository: https://github.com/starnight/MicroHttpServer
// commit: a8ab029
// extract of: c-version/lib/server.c (function: _ParseHeader)

#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

void _ParseHeader(int *clisock, char *req_buf) {
  int n;
  int i = 0;
  char *p = req_buf;

  n = recv(*clisock, p, 3, 0);
  if (n == 3) {
    for (i = 3; n > 0; i++) {
      n = recv(*clisock, p + i, 1, 0);
      if (p[i] == ' ') {
        p[i] = '_';
        break;
      }
    }

    /* Parse URI. */
    if (n > 0)
      i += 1;

    for (; n > 0; i++) {
      n = recv(*clisock, p + i, 1, 0); // Problem: code is taking data from client socket and copying to over to req_buf 1 byte at a time while
      // waiting for an empty space. This is a potential req_buf overflow, if url is longer then the req_buf size
      if (p[i] == ' ') {
        p[i] = '\0';
        break;
      }
    }
  }
}

char *getResponse() {
  char *output = calloc(3000, sizeof(char));
  char *content = "<h1>Hello</h1>";
  char *httpVersion = "HTTP/1.1 200 OK\r\n";
  char *contentLengthTitle = "Content-Length: ";

  char contentLengthSize[10] = {0};
  sprintf((char *)contentLengthSize, "%d", (int)strlen(content));

  char *newLine = "\r\n";
  char contentLength[40] = {0};
  strncat(contentLength, contentLengthTitle, strlen(contentLengthTitle));
  strncat(contentLength, (char *)contentLengthSize, strlen((char *)contentLengthSize));
  strncat(contentLength, newLine, strlen(newLine));

  char *server = "Server: custom\r\n";
  char *contentType = "Content-Type: text/html; charset=UTF-8";
  strncat(output, httpVersion, strlen(httpVersion));
  strncat(output, contentLength, strlen(contentLength));
  strncat(output, server, strlen(server));
  strncat(output, contentType, strlen(contentType));
  strncat(output, newLine, strlen(newLine));
  strncat(output, newLine, strlen(newLine));
  strncat(output, content, strlen(content));
  strncat(output, newLine, strlen(newLine));
  strncat(output, newLine, strlen(newLine));
  return output;
}

int main(int argc, char *argv[]) {
  struct sockaddr_in srv_addr;
  char req_buf[20];
  int sock;
  int clisock;
  sock = socket(AF_INET, SOCK_STREAM, 0);

  if (sock <= 0)
    return -1;

  memset(&srv_addr, 0, sizeof(struct sockaddr_in));
  srv_addr.sin_family = AF_INET;
  srv_addr.sin_port = htons(8080);
  srv_addr.sin_addr.s_addr = htonl(INADDR_ANY);

  if (bind(sock, (struct sockaddr *)&srv_addr, sizeof(srv_addr)) == -1) {
    exit(1);
  }
  listen(sock, 0);

  while (1) {
    struct sockaddr_in cli_addr;
    int client_name_len = sizeof(struct sockaddr_in);
    if ((clisock = accept(sock, (struct sockaddr *)&cli_addr, (socklen_t *)&client_name_len)) < 0) {
      return -1;
    }
    _ParseHeader(&clisock, req_buf);
    printf("%s\n", req_buf);
    char *response = getResponse();
    write(clisock, response, strlen(response));
    close(clisock);
    free(response);
  }

  //

  shutdown(sock, SHUT_RDWR);
  close(sock);
}
