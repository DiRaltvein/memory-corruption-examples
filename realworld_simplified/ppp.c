// https://www.cvedetails.com/cve/CVE-2022-4603/
// repository: https://github.com/ppp-project/ppp
// commit: fb3529c
// extract of: pppdump/pppdump.c (function: dumpppp)

#include <stdio.h>

#define BUF_LEN 128
#define GETC_FROM_BUFFER(buf, offset, size) \
    (((offset) < (size)) ? (buf)[(offset)++] : EOF)

struct pkt {
  int cnt;
  int esc;
  unsigned char buf[BUF_LEN];
} spkt, rpkt;

int dumpppp(unsigned char* buf, int bufSize)
{
  int pointer = 0;
  int c, n, k;
  int nb, nl;
  char *dir;
  unsigned char *p;
  struct pkt *pkt;

  spkt.cnt = rpkt.cnt = 0;
  spkt.esc = rpkt.esc = 0;
  while ((c = GETC_FROM_BUFFER(buf, pointer, bufSize)) != EOF) {
    switch (c) {
    case 1:
    case 2:
      dir = c == 1 ? "sent" : "rcvd";
      pkt = c == 1 ? &spkt : &rpkt;
      n = GETC_FROM_BUFFER(buf, pointer, bufSize);
      int tmp = GETC_FROM_BUFFER(buf, pointer, bufSize);
      if (n == EOF || tmp == EOF) {
        return 1;
      }
      n = (n << 8) + tmp;
      for (; n > 0; --n) {
        c = GETC_FROM_BUFFER(buf, pointer, bufSize);
        switch (c) {
        case EOF:
          printf("\nEOF\n");
          if (spkt.cnt > 0)
            printf("[%d bytes in incomplete send packet]\n",
                   spkt.cnt);
          if (rpkt.cnt > 0)
            printf("[%d bytes in incomplete recv packet]\n",
                   rpkt.cnt);
          return 1;
        case '~':
          if (pkt->cnt > 0) {
            if (pkt->esc) {
              printf("%s aborted packet:\n     ", dir);
            }
            nb = pkt->cnt;
            p = pkt->buf;
            pkt->cnt = 0;
            pkt->esc = 0;
            if (nb <= 2) {
              printf("short packet [%d bytes]:", nb);
              for (k = 0; k < nb; ++k)
                printf(" %.2x", p[k]);
              printf("\n");
              break;
            }
            nb -= 2;
            do {
              nl = nb < 16 ? nb : 16;
              for (k = 0; k < nl; ++k)
                printf(" %.2x", p[k]);
              for (; k < 16; ++k)
                printf("   ");
              printf("  ");
              for (k = 0; k < nl; ++k) {
                c = p[k];
                putchar((' ' <= c && c <= '~') ? c : '.');
              }
              printf("\n");
              p += nl;
              nb -= nl;
            } while (nb > 0);
          }
          break;
        case '}':
          if (!pkt->esc) {
            pkt->esc = 1;
            break;
          }
          /* else fall through */
        default:
          if (pkt->esc) {
            c ^= 0x20;
            pkt->esc = 0;
          }
          pkt->buf[pkt->cnt++] = c; // Problem: potential buffer overflow as pkt->cnt can become greater than pkt->buf
          break;
        }
      }
      break;
    case 3:
    case 4:
      dir = c == 3 ? "send" : "recv";
      pkt = c == 3 ? &spkt : &rpkt;
      printf("end %s", dir);
      if (pkt->cnt > 0)
        printf("  [%d bytes in incomplete packet]", pkt->cnt);
      printf("\n");
      break;
    default:
      printf("?%.2x\n", c);
    }
  }

  return 0;
}

int main() {
  unsigned char data[BUF_LEN + 20];
  int size = sizeof(data) / sizeof(data[0]);

  // setup malicious input
  data[0] = 0x01;
  data[1] = 0x01; // len
  data[2] = 0x01; // len

  for (int i = 3; i < size; i += 2) {
    data[i] = i <= 0xff ? (unsigned char)i : ((unsigned char)i - 0xff);
  }

  return dumpppp(data, size);
}