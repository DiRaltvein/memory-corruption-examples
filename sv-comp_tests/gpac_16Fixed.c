// https://www.cvedetails.com/cve/CVE-2023-1448/
// repository: <https://github.com/gpac/gpac
// commit: a5efec8
// extract of: src/media_tools/mpegts.c (function: gf_m2ts_process_sdt)

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char u8;
typedef unsigned int u32;

extern unsigned char __VERIFIER_nondet_uchar();
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random integer in specified range
 */
int getNumberInRange(int lowestBound, int highestBound) {
  int value = __VERIFIER_nondet_int();
  while (value < lowestBound || value > highestBound) {
    value = __VERIFIER_nondet_int();
  }
  return value;
}

/**
 * Just a utility function in test creation that generates random sequence of unsigned characters (sequence is not zero terminated)
 */
u8 *getRandomByteStream(int size) {
  u8 *randomString = (u8*)calloc(size, sizeof(u8));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < size; i++) {
    randomString[i] = __VERIFIER_nondet_uchar();
  }
  return randomString;
}

// function that processes a services from Service Description Table (SDT) that is part of part of the MPEG-TS.
void gf_m2ts_process_sdt(u8 *data, u32 data_size) {
  u32 pos = 0;
  while (pos < data_size) {
    u32 descs_size, d_pos, ulen;

    if (data_size - pos < 5)
      return; // ensure that there is at least 5 bytes for a header data

    u32 service_id = (data[pos] << 8) + data[pos + 1];
    u32 EIT_schedule = (data[pos + 2] & 0x2) ? 1 : 0;
    u32 EIT_present_following = (data[pos + 2] & 0x1);
    u32 running_status = (data[pos + 3] >> 5) & 0x7;
    u32 free_CA_mode = (data[pos + 3] >> 4) & 0x1;
    descs_size = ((data[pos + 3] & 0xf) << 8) | data[pos + 4];
    pos += 5;

    printf("service_id: %u\n", service_id);
    printf("EIT_schedule: %u\n", EIT_schedule);
    printf("EIT_present_following: %u\n", EIT_present_following);
    printf("running_status: %u\n", running_status);
    printf("free_CA_mode: %u\n", free_CA_mode);
    printf("descs_size: %u\n", descs_size);

    if (pos + descs_size > data_size) {
      return;
    }

    d_pos = 0;
    while (d_pos + 1 < descs_size) {
      u8 d_tag = data[pos + d_pos];
      u8 d_len = data[pos + d_pos + 1];

      switch (d_tag) {
      case 0x48:
      {
        d_pos += 2;

        if (d_pos + 1 >= descs_size) {
          break;
        }

        u8 service_type = data[pos + d_pos];
        ulen = data[pos + d_pos + 1];
        d_pos += 2;

        if (d_pos + ulen >= descs_size || ulen == 0) {
          break;
        }

        char *provider = (char *)malloc(sizeof(char) * (ulen + 1));
        memcpy(provider, data + pos + d_pos, sizeof(char) * ulen);
        provider[ulen] = 0;
        d_pos += ulen;

        if (d_pos >= descs_size) {
          free(provider);
          break;
        }

        ulen = data[pos + d_pos];
        d_pos += 1;

        if (d_pos + ulen >= descs_size || ulen == 0) {
          free(provider);
          break;
        }

        char *service = (char *)malloc(sizeof(char) * (ulen + 1));
        memcpy(service, data + pos + d_pos, sizeof(char) * ulen);
        service[ulen] = 0;
        d_pos += ulen;

        printf("Service type: 0x%x, Provider: %s, Service: %s\n", service_type, provider, service);
        free(provider);
        free(service);
        break;
      }
      default:
        printf("Skipping descriptor (0x%x) not supported\n", d_tag);
        d_pos += d_len;
        if (d_len == 0)
          d_pos = descs_size;
        break;
      }
    }
    printf("\n");
    pos += descs_size;
  }
}

int main() {
  u32 len = (u32)getNumberInRange(5, 1000);
  u8 *sdt_data = getRandomByteStream(len);

  gf_m2ts_process_sdt(sdt_data, len);
  free(sdt_data);
}
