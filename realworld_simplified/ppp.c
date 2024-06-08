// https://www.cvedetails.com/cve/CVE-2022-4603/
// extract of: pppdump/pppdump.c

#include <stdio.h>

struct pkt
{
    int pointer;
    unsigned char buf[10];
};

int main(int argc, char *argv[])
{
    struct pkt pkt;
    pkt.pointer = 0;
    for (int i = 0; i < 15; i++)
    {
        printf("%d\n", pkt.pointer);
        pkt.buf[pkt.pointer++] = i;
    }
}
