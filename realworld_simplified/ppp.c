// https://www.cvedetails.com/cve/CVE-2022-4603/
// repository: https://github.com/ppp-project/ppp
// commit: fb3529c
// extract of: pppdump/pppdump.c (function: dumpppp)

struct pkt {
  int pointer;
  unsigned char buf[10];
};

int main(int argc, char *argv[]) {
  struct pkt pkt;
  pkt.pointer = 0;
  for (int i = 0; i < 15; i++) {
    pkt.buf[pkt.pointer++] = i; // Problem: pkt.pointer gets as high as 14 while buffer is only 10 bytes long
  }
}
