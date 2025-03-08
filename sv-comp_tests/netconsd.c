// https://www.cvedetails.com/cve/CVE-2023-28753/
// repository: https://github.com/facebook/netconsd
// commit: 94f035b
// extract of: netconsd/ncrx/libncrx.c (function: ncrx_queue_payload)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NCRX_LINE_MAX 8192

struct ncrx_msg {
  /* public fields */
  uint64_t seq;     /* printk sequence number */
  uint64_t ts_usec; /* printk timestamp in usec */
  char *text;       /* message body */
  int text_len;     /* message body length */

  uint8_t facility;        /* log facility */
  uint8_t level;           /* printk level */
  unsigned cont_start : 1; /* first of continued msgs */
  unsigned cont : 1;       /* continuation of prev msg */

  int ncfrag_off;  /* netconsole frag offset */
  int ncfrag_len;  /* netconsole frag len */
  int ncfrag_left; /* number of missing bytes */

  unsigned emg : 1; /* emergency transmission */
};

int parse_packet(const char *payload, struct ncrx_msg *msg) {
  char buf[1024];
  char *p, *tok;
  int idx;

  memset(msg, 0, sizeof(*msg));

  p = strchr(payload, ';');
  if (!p || p - payload >= (signed)sizeof(buf))
    goto einval;
  memcpy(buf, payload, p - payload);
  buf[p - payload] = '\0';

  msg->text = p + 1;
  msg->text_len = strlen(msg->text);
  if (msg->text_len > NCRX_LINE_MAX)
    msg->text_len = NCRX_LINE_MAX;

  /* <level>,<sequnum>,<timestamp>,<contflag>[,KEY=VAL]* */
  idx = 0;
  p = buf;
  while ((tok = strsep(&p, ","))) {
    char *endp, *key, *val;
    unsigned long long v;

    switch (idx++) {
    case 0:
      v = strtoul(tok, &endp, 0);
      if (*endp != '\0' || v > UINT8_MAX)
        goto einval;
      msg->facility = v >> 3;
      msg->level = v & ((1 << 3) - 1);
      continue;
    case 1:
      v = strtoull(tok, &endp, 0);
      if (*endp != '\0')
        goto einval;
      msg->seq = v;
      continue;
    case 2:
      v = strtoull(tok, &endp, 0);
      if (*endp != '\0')
        goto einval;
      msg->ts_usec = v;
      continue;
    case 3:
      if (tok[0] == 'c')
        msg->cont_start = 1;
      else if (tok[0] == '+')
        msg->cont = 1;
      continue;
    }

    val = tok;
    key = strsep(&val, "=");
    if (!val)
      continue;
    if (!strcmp(key, "ncfrag")) {
      unsigned nf_off, nf_len;

      if (sscanf(val, "%u/%u", &nf_off, &nf_len) != 2)
        goto einval;
      if (!msg->text_len ||
          nf_len >= NCRX_LINE_MAX ||
          nf_off + msg->text_len > nf_len) // Problem: integer overflow here because nf_off is 4294967277, text_len is 19 and nf_len 1000
        goto einval;

      msg->ncfrag_off = nf_off;
      msg->ncfrag_len = msg->text_len;
      msg->ncfrag_left = nf_len - msg->ncfrag_len;
      msg->text_len = nf_len; // Problem: text_len is changes while the text field data is not touched. It leads to cases where text and text_len values are not connected and length is smaller/greater than the actual length of text
    } else if (!strcmp(key, "ncemg")) {
      v = strtoul(val, &endp, 0);
      if (*endp != '\0')
        goto einval;
      msg->emg = v;
    }
  }
  return 0;
einval:
  return -1;
}

char *copy_msg(struct ncrx_msg *src) {
  char *dst;

  dst = malloc(src->text_len + 1);
  if (!dst)
    return NULL;

  memcpy(dst, src->text, src->text_len); // Problem: stack buffer overflow. text_len is set to 1000 while src->text is only 19 characters long
  dst[src->text_len] = '\0';
  return dst;
}

int main() {
  char data[] = "4,101,1700000001,c,ncfrag=4294967277/1000;Some random message";
  struct ncrx_msg msg = {0};

  if (parse_packet(data, &msg) == 0) {
    printf("Initial text %s\n", msg.text);
    char *copy = copy_msg(&msg);
    if (copy) {
      printf("copy text %s\n", copy);
      free(copy);
    }
  }

  return 0;
}
