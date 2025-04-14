// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-39975/
// repository: https://github.com/krb5/krb5
// commit: 0ceab6c
// extract of: src/kdc/do_tgs_req.c (function: process_tgs_req)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

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
    goto cleanup;
  }

  ret = krb5_encrypt_tkt_part(&ticket_reply);

  if (ret) {
    goto cleanup;
  }

  printf("Encrypted data: %s\n", ticket_reply.enc_part.ciphertext.data);

cleanup:
  if (ticket_reply.enc_part.ciphertext.data != NULL) {
    free(ticket_reply.enc_part.ciphertext.data); // first free of the ciphertext.data memory segment
  }
  return ret;
}

void krb5_free_ticket(krb5_ticket *val) {
  if (val == NULL) {
    return;
  }
  free(val->enc_part.ciphertext.data); // Problem: second free of the same memory segment
  free(val);
}

int gather_tgs_req_info(struct tgs_req_info *val) {
  val->flags = (unsigned int)getNumberInRange(1, 255);
  val->header_tkt = calloc(1, sizeof(krb5_ticket));
  if (val->header_tkt == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  val->header_tkt->enc_part.ciphertext.data = getRandomString(1, 500);
  val->header_tkt->enc_part.ciphertext.length = strlen(val->header_tkt->enc_part.ciphertext.data);
  return 0;
}

// process_tgs_req
int main() {
  int ret = 0;
  struct tgs_req_info t = {0};

  ret = gather_tgs_req_info(&t);
  if (ret)
    goto cleanup;

  tgs_issue_ticket(&t);

cleanup:
  krb5_free_ticket(t.header_tkt);
}
