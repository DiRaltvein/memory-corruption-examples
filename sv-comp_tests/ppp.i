struct pkt {
  int pointer;
  unsigned char buf[10];
};
int main() {
  struct pkt pkt;
  pkt.pointer = 0;
  for (int i = 0; i < 15; i++) {
    pkt.buf[pkt.pointer++] = i;
  }
}
