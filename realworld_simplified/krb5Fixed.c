// https://www.cvedetails.com/cve/CVE-2023-39975/
// repository: https://github.com/krb5/krb5
// commit: 0ceab6c
// extract of: src/kdc/do_tgs_req.c (function: process_tgs_req)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _krb5_data {
  unsigned int length;
  char *data;
} krb5_data;

typedef struct _krb5_enc_data {
  krb5_data ciphertext;
} krb5_enc_data;

typedef struct _krb5_ticket {
  krb5_enc_data enc_part;
} krb5_ticket;

struct tgs_req_info {
  krb5_ticket *header_tkt;
  unsigned int flags;
};

int handle_authdata(struct tgs_req_info *t) {
  if (t->header_tkt->enc_part.ciphertext.length < 15) {
    return 1;
  }

  return 0;
}

int krb5_encrypt_tkt_part(krb5_ticket *t) {
  if (t->enc_part.ciphertext.data == NULL) {
    char noData[] = "No data to encrypt";
    t->enc_part.ciphertext.data = calloc(strlen(noData) + 1, sizeof(char));
    if (t->enc_part.ciphertext.data == NULL) {
      printf("Out of memory\n");
      return 1;
    }
    memcpy(t->enc_part.ciphertext.data, (char *)noData, strlen(noData));
    t->enc_part.ciphertext.length = strlen(noData);
    return 0;
  }
  char *encrypted = calloc(t->enc_part.ciphertext.length * 2 + 1, sizeof(char));
  if (encrypted == NULL) {
    t->enc_part.ciphertext.data = NULL;
    printf("Out of memory\n");
    return 1;
  }
  int j = 0;
  // when text is given ofcourse no encryption is done for simplicity sake of test case
  // just go over each character and substitute every 'a' with 'aa' for fun
  for (unsigned int i = 0; i < t->enc_part.ciphertext.length; i++) {
    if (t->enc_part.ciphertext.data[i] == 'a') {
      encrypted[j++] = 'a';
      encrypted[j++] = 'a';
    } else {
      encrypted[j++] = t->enc_part.ciphertext.data[i];
    }
  }
  t->enc_part.ciphertext.data = encrypted;

  return 0;
}

int tgs_issue_ticket(struct tgs_req_info *t) {
  int ret = 0;
  krb5_ticket ticket_reply = {0};

  if (t->flags & (1 << 2)) {
    ticket_reply = *t->header_tkt;
  }

  ret = handle_authdata(t);
  if (ret) {
    return ret;
  }

  ret = krb5_encrypt_tkt_part(&ticket_reply);

  if (ret) {
    goto cleanup;
  }

  printf("Encrypted data: %s\n", ticket_reply.enc_part.ciphertext.data);

cleanup:
  if (ticket_reply.enc_part.ciphertext.data != NULL) {
    free(ticket_reply.enc_part.ciphertext.data);
  }
  return ret;
}

void krb5_free_ticket(krb5_ticket *val) {
  if (val == NULL) {
    return;
  }
  free(val->enc_part.ciphertext.data);
  free(val);
}

int gather_tgs_req_info(struct tgs_req_info *val, int argc, char *argv[]) {
  if (argc < 2) {
    printf("Usage: %s <text to encode>\n", argv[0]);
    return 1;
  }
  val->flags = (unsigned int)argc;
  val->header_tkt = calloc(1, sizeof(krb5_ticket));
  if (val->header_tkt == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  val->header_tkt->enc_part.ciphertext.length = strlen(argv[1]);
  val->header_tkt->enc_part.ciphertext.data = calloc(val->header_tkt->enc_part.ciphertext.length + 1, sizeof(char));
  if (val->header_tkt->enc_part.ciphertext.data == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  memcpy(val->header_tkt->enc_part.ciphertext.data, argv[1], val->header_tkt->enc_part.ciphertext.length);
  return 0;
}

// process_tgs_req
int main(int argc, char *argv[]) {
  int ret = 0;
  struct tgs_req_info t = {0};

  ret = gather_tgs_req_info(&t, argc, argv);
  if (ret)
    goto cleanup;

  tgs_issue_ticket(&t);

cleanup:
  krb5_free_ticket(t.header_tkt);
}
