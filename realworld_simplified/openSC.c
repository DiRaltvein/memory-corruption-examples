// https://www.cvedetails.com/cve/CVE-2023-2977/
// repository: https://github.com/OpenSC/OpenSC
// commit: fe7cb49
// extract of: src/pkcs15init/pkcs15-cardos.c (function: cardos_have_verifyrc_package)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SC_ASN1_TAGNUM_SIZE 3
#define SC_ASN1_TAG_PRIMITIVE 0x1F
#define SC_ASN1_TAG_CLASS 0xC0
#define SC_ASN1_TAG_CONSTRUCTED 0x20

int sc_asn1_read_tag(const uint8_t **buf, size_t buflen, unsigned int *cla_out, unsigned int *tag_out, size_t *taglen) {
  const uint8_t *p = *buf;
  size_t left = buflen, len;
  unsigned int cla, tag, i;

  *buf = NULL;

  if (left == 0 || !p)
    return 1;
  if (*p == 0xff || *p == 0) { // Problem: pointer p may be out of bounds
    /* end of data reached */
    *taglen = 0;
    *tag_out = 0;
    return 0;
  }

  /* parse tag byte(s)
   * Resulted tag is presented by integer that has not to be
   * confused with the 'tag number' part of ASN.1 tag.
   */
  cla = (*p & SC_ASN1_TAG_CLASS) | (*p & SC_ASN1_TAG_CONSTRUCTED);
  tag = *p & SC_ASN1_TAG_PRIMITIVE;
  p++;
  left--;
  if (tag == SC_ASN1_TAG_PRIMITIVE) {
    /* high tag number */
    size_t n = SC_ASN1_TAGNUM_SIZE - 1;
    /* search the last tag octet */
    do {
      if (left == 0 || n == 0)
        /* either an invalid tag or it doesn't fit in
         * unsigned int */
        return 1;
      tag <<= 8;
      tag |= *p;
      p++;
      left--;
      n--;
    } while (tag & 0x80);
  }

  /* parse length byte(s) */
  if (left == 0)
    return 1;
  len = *p;
  p++;
  left--;
  if (len & 0x80) {
    len &= 0x7f;
    unsigned int a = 0;
    if (len > sizeof a || len > left)
      return 1;
    for (i = 0; i < len; i++) {
      a <<= 8;
      a |= *p;
      p++;
      left--;
    }
    len = a;
  }

  *cla_out = cla;
  *tag_out = tag;
  *taglen = len;
  *buf = p;

  if (len > left)
    return 1;

  return 0;
}

const uint8_t *sc_asn1_find_tag(const uint8_t *buf, size_t buflen, unsigned int tag_in, size_t *taglen_in) {
  size_t left = buflen, taglen;
  const uint8_t *p = buf;

  *taglen_in = 0;
  while (left >= 2) {
    unsigned int cla = 0, tag, mask = 0xff00;

    buf = p;
    /* read a tag */
    if (sc_asn1_read_tag(&p, left, &cla, &tag, &taglen) != 0 || p == NULL)
      return NULL;

    left -= (p - buf);
    /* we need to shift the class byte to the leftmost
     * byte of the tag */
    while ((tag & mask) != 0) {
      cla <<= 8;
      mask <<= 8;
    }
    /* compare the read tag with the given tag */
    if ((tag | cla) == tag_in) {
      /* we have a match => return length and value part */
      if (taglen > left)
        return NULL;
      *taglen_in = taglen;
      return p;
    }
    /* otherwise continue reading tags */
    left -= taglen;
    p += taglen;
  }
  return NULL;
}

int main() {
  uint8_t rbuf[] = {
    0xE2, 0x02, 0x00, 0x00,
    0xE1, 0x06, 0x03, 0x04, 0x54, 0x1A, 0x9A, 0xB3,
    0xE1, 0x06, 0x03, 0x04, 0xE9, 0xBA, 0x1B, 0xAA
  };
  const uint8_t *p = rbuf, *q;
  size_t len = sizeof(rbuf) / sizeof(rbuf[0]), tlen = 0, ilen = 0;

  while (len != 0) {
    p = sc_asn1_find_tag(p, len, 0xE1, &tlen);
    if (p == NULL) {
      printf("Could not find tag 0xE1\n");
      return 0;
    }
    q = sc_asn1_find_tag(p, tlen, 0x03, &ilen);
    if (q == NULL || ilen != 4) {
      printf("Could not find tag 0x03 inside a 0xE1 tag or its length is not 4\n");
      return 0;
    }
    if (q[0] == 0x02) {
      printf("Found 0x02 byte as a first byte after 0x03 tag\n");
      return 1;
    }
    p += tlen;
    len -= tlen + 2;
  }
}
