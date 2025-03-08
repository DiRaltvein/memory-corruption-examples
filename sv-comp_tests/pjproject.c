// https://www.cvedetails.com/cve/CVE-2023-27585/
// repository: https://github.com/pjsip/pjproject
// commit: 5e2d564
// extract of: pjlib-util/src/pjlib-util/dns.c (function: parse_rr)

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#ifdef linux
#include <arpa/inet.h>
#include <netinet/in.h>
#endif
#ifdef _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#endif

#define PJ_DNS_TYPE_A 1
#define PJ_DNS_TYPE_AAAA 28

typedef struct pj_dns_parsed_rr {
  uint16_t  type;      /**< RR type code.                              */
  uint16_t  dnsclass;  /**< Class of data (PJ_DNS_CLASS_IN=1).         */
  uint32_t  ttl;       /**< Time to live.                              */
  uint16_t  rdlength;  /**< Resource data length.                      */
  unsigned char *data;

  union rdata
    {
        /** A Resource Data (PJ_DNS_TYPE_A, 1) */
        struct a {
            struct in_addr ip_addr;/**< IPv4 address in network byte order.    */
        } a; /**< A Resource Data (PJ_DNS_TYPE_A, 1) */

        /** AAAA Resource Data (PJ_DNS_TYPE_AAAA, 28) */
        struct aaaa {
            struct in6_addr ip_addr;/**< IPv6 address in network byte order.    */
        } aaaa; /**< AAAA Resource Data (PJ_DNS_TYPE_AAAA, 28) */

    } rdata;
} pj_dns_parsed_rr;

int parse_rr(pj_dns_parsed_rr *rr, const uint8_t *start, const uint8_t *max, int *parsed_len) {
    const uint8_t *p = start;

    /* DNS name parsing is omitted for simplicity sake */

    /* Check the size can accomodate next few fields. */
    if (p+10 > max)
        return 1;

    /* Get the type */
    memcpy(&rr->type, p, 2);
    p += 2;
    
    /* Get the class */
    memcpy(&rr->dnsclass, p, 2);
    p += 2;

    /* Class MUST be IN */
    if (rr->dnsclass != 1) {
        return 1;
    }

    /* Get TTL */
    memcpy(&rr->ttl, p, 4);
    p += 4;

    /* Get rdlength */
    memcpy(&rr->rdlength, p, 2);
    p += 2;

    /* Check that length is valid */
    if (p + rr->rdlength > max)
        return 1;

    /* Parse some well known records */
    if (rr->type == PJ_DNS_TYPE_A) {
        // Problem: code assumes that if type is PJ_DNS_TYPE_A than packet has 4 bytes but it may not be the case
        // Packet may be malformed with missing/partially missing data section that will result in a p buffer access out of bound
        memcpy(&rr->rdata.a.ip_addr, p, 4);
        p += 4;

    } else if (rr->type == PJ_DNS_TYPE_AAAA) {
        memcpy(&rr->rdata.aaaa.ip_addr, p, 16); // Problem: the same problem as with PJ_DNS_TYPE_A, p buffer may not contain 16 bytes in data section
        p += 16;

    } else {
        /* Copy the raw data */
        rr->data = calloc(rr->rdlength, 1);
        memcpy(rr->data, p, rr->rdlength);

        p += rr->rdlength;
    }

    *parsed_len = (int)(p - start);
    return 0;
};

int main() {
    // in little endian
    uint8_t data[] = {
    0x01, 0x00,             // type
    0x01, 0x00,             // class
    0x10, 0x0E, 0x00, 0x00, // TTL
    0x04, 0x00,             // data length
    0x08, 0x08, 0x08, 0x08, // data (ipv4 address)

    0x05, 0x00,             // type
    0x01, 0x00,             // class
    0x10, 0x0E, 0x00, 0x00, // TTL
    0x04, 0x00,             // data length
    0x08, 0x08, 0x08, 0x08, // data (ipv4 address)

    0x1C, 0x00,             // type
    0x01, 0x00,             // class
    0x10, 0x0E, 0x00, 0x00, // TTL
    0x0A, 0x00,             // data length (length is correct for malformed packet but ipv6 consists of 16 bytes while length specifies only 10 bytes in data section)
    0x20, 0x01, 0x0d, 0xb8, 0x85, 0xa3, 0x00, 0x00, 0x00, 0x00, 0x8a, 0x2e, // data (ipv6 address) INCOMPLETE
    // example of complete ipv6 address: 0x20, 0x01, 0x0d, 0xb8, 0x85, 0xa3, 0x00, 0x00, 0x00, 0x00, 0x8a, 0x2e, 0x03, 0x70, 0x73, 0x34
  };

  uint32_t dataSize = sizeof(data) / sizeof(data[0]);
  uint8_t *start = (uint8_t *)&data;
  uint8_t *end = &data[dataSize - 1];

  while (start < end) {
    pj_dns_parsed_rr pj_dns_parsed_rr = {0};
    int parsed_len = 0;
    int status = parse_rr(&pj_dns_parsed_rr, start, end, &parsed_len); // malicious function call
    if (status != 0) {
      printf("Error occured\n");
      return 1;
    }
    // just printing of parsed DNS results
    printf("type: %d, class: %d, ttl: %u, data length: %d\n", pj_dns_parsed_rr.type, pj_dns_parsed_rr.dnsclass, pj_dns_parsed_rr.ttl, pj_dns_parsed_rr.rdlength);
    if (pj_dns_parsed_rr.type == PJ_DNS_TYPE_A) {
        char ip4addr[INET_ADDRSTRLEN];
        inet_ntop(AF_INET, &(pj_dns_parsed_rr.rdata.a.ip_addr), ip4addr, INET_ADDRSTRLEN);
        printf("ipv4 address: %s\n", ip4addr);
    } else if (pj_dns_parsed_rr.type == PJ_DNS_TYPE_AAAA) {
        char ip6addr[INET6_ADDRSTRLEN];
        inet_ntop(AF_INET6, &(pj_dns_parsed_rr.rdata.aaaa.ip_addr), ip6addr, INET6_ADDRSTRLEN);
        printf("ipv6 address: %s\n", ip6addr);
    } else {
        printf("raw value: ");
        for (int i = 0; i < pj_dns_parsed_rr.rdlength; i++) {
            printf("0x%02x", pj_dns_parsed_rr.data[i]);
            if (i < pj_dns_parsed_rr.rdlength - 1) {
                printf(", ");
            }
        }
        printf("\n");
        free(pj_dns_parsed_rr.data);
    }
    start += parsed_len;
  }
}
