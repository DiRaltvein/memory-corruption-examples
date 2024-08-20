// https://www.cvedetails.com/cve/CVE-2023-40296/
// repository: https://github.com/eminfedar/async-sockets-cpp
// commit: d66588d
// extract of: async-sockets/include/udpsocket.hpp (function: Receive)

#if defined(__linux__) || defined(__APPLE__)
#include <arpa/inet.h>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#elif _WIN32
#include <winsock32.h>
#endif

#include <cerrno>
#include <functional>
#include <iostream>
#include <string>
#include <thread>

#define BUFFER_SIZE 16
#define ADDRESS "0.0.0.0"

class UDPSocket {
public:
  explicit UDPSocket() {
    // SOCK_STREAM - TCP, SOCK_DGRAM - UDP
    this->sock = socket(AF_INET, SOCK_DGRAM, 0);

    std::thread t(Receive, this);
    t.detach();
  }

  void Close() {
    shutdown(this->sock, SHUT_RDWR);
    close(this->sock);
  }

  int Bind(std::uint16_t port) {

    int status = inet_pton(AF_INET, ADDRESS, &this->address.sin_addr);
    if (status <= 0)
      return -1;

    this->address.sin_family = AF_INET;
    this->address.sin_port = htons(port);

    status = bind(this->sock, (const sockaddr *)&this->address, sizeof(this->address));
    if (status == -1) {
      return -1;
    }

    return 0;
  }

private:
  int sock = 0;
  sockaddr_in address;

  static void Receive(UDPSocket *udpSocket) {
    std::cout << "received" << std::endl;
    char tempBuffer[BUFFER_SIZE];
    int messageLength;

    while ((messageLength = recv(udpSocket->sock, tempBuffer, BUFFER_SIZE, 0)) != -1) {
      tempBuffer[messageLength] = '\0'; // Problem: potential buffer overflow if message is longer then BUFFER_SIZE

      std::cout << std::string(tempBuffer, messageLength) << std::endl;
    }
  }
};

int main(int argc, char *argv[]) {
  int status;
  UDPSocket udpServer;

  status = udpServer.Bind(8888);
  if (status == -1)
    return -1;

  std::string input;
  std::getline(std::cin, input);
  while (input != "exit") {
    std::getline(std::cin, input);
  }

  udpServer.Close();

  return 0;
}
