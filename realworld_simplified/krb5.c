// https://www.cvedetails.com/cve/CVE-2023-39975/
// repository: https://github.com/krb5/krb5
// commit: 0ceab6c
// extract of: src/kdc/do_tgs_req.c (function: process_tgs_req)

#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct _krb5_data {
  unsigned int length;
  char *data; // pointer that gets freed 2 times
} krb5_data;

typedef struct _krb5_enc_data {
  krb5_data ciphertext;
} krb5_enc_data;

typedef struct _krb5_ticket {
  krb5_enc_data enc_part;
} krb5_ticket;

struct tgs_req_info {
  krb5_ticket *header_tkt;
};

void tgs_issue_ticket(struct tgs_req_info *t) {
  krb5_ticket ticket_reply = *t->header_tkt;

  time_t now = time(NULL);
  struct tm *tm = localtime(&now);

  if (tm->tm_hour > 5) {
    goto cleanup; // In case it is 6 hours or more skip the ciphertext.data reassignment part
  }

  ticket_reply.enc_part.ciphertext.data = calloc(6, sizeof(char));

cleanup:
  free(ticket_reply.enc_part.ciphertext.data); // First free of data memory segment (if it is more than 6 hours)
}

int main(int argc, char *argv[]) {
  struct tgs_req_info t = {0};
  t.header_tkt = (krb5_ticket *)malloc(sizeof(krb5_ticket));
  t.header_tkt->enc_part.ciphertext.data = calloc(6, sizeof(char));

  tgs_issue_ticket(&t);

  free(t.header_tkt->enc_part.ciphertext.data); // Problem: second free of the same data memory segment
  free(t.header_tkt);
}
