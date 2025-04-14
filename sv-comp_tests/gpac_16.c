// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-1448/
// repository: https://github.com/gpac/gpac
// commit: a5efec8
// extract of: src/media_tools/mpegts.c (function: gf_m2ts_process_sdt)

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "helpers.c"

typedef unsigned char u8;
typedef unsigned int u32;

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

    d_pos = 0;
    while (d_pos < descs_size) {
      // Problem: because code assumes that descriptors size (descs_size) can not be greater than total data size (data_size) descs_size is not validated in any way
      // this may lead to pos + d_pos exceeding data_size that would lead to a stack buffer overflow on line 38 as well as following lines
      u8 d_tag = data[pos + d_pos];
      u8 d_len = data[pos + d_pos + 1];

      switch (d_tag) {
      case 0x48:
        d_pos += 2;
        u8 service_type = data[pos + d_pos];
        ulen = data[pos + d_pos + 1];
        d_pos += 2;
        char *provider = (char *)malloc(sizeof(char) * (ulen + 1));
        memcpy(provider, data + pos + d_pos, sizeof(char) * ulen);
        provider[ulen] = 0;
        d_pos += ulen;

        ulen = data[pos + d_pos];
        d_pos += 1;
        char *service = (char *)malloc(sizeof(char) * (ulen + 1));
        memcpy(service, data + pos + d_pos, sizeof(char) * ulen);
        service[ulen] = 0;
        d_pos += ulen;

        printf("Service type: 0x%x, Provider: %s, Service: %s\n", service_type, provider, service);
        free(provider);
        free(service);
        break;

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
  // u8 sdt_data[] = {
  //     // service 1 completly valid
  //     0x00, 0x00, // service id
  //     0xfe,       // 6 reserved bits + EIT schedule flag  + EIT present/following flag
  //     0x50,       // 3 bits running status + free CA mode flag + 4 bits descriptors loop length
  //     0x0f,       // 8 additional bits of descriptors loop length

  //     // descriptor 1
  //     0x48,                               // descriptor tag
  //     0x0f,                               // descriptor length
  //     0x01,                               // service_type
  //     0x05, 0x68, 0x65, 0x6c, 0x6c, 0x6f, // provider with 1 first byte showing its length
  //     0x05, 0x77, 0x6F, 0x72, 0x6C, 0x64, // service with 1 first byte showing its length

  //     // service 2 with vulnerability (descriptors length is set to 255 (0x0ff) while it is really only 23 bytes long that causes stack buffer overflow)
  //     0x00, 0x01, // service id
  //     0xfe,       // 6 reserved bits + EIT schedule flag  + EIT present/following flag
  //     0x50,       // 3 bits running status + free CA mode flag + 4 bits descriptors loop length
  //     0xff,       // 8 additional bits of descriptors loop length

  //     // descriptor 2
  //     0x48,                                                                               // descriptor tag
  //     0x17,                                                                               // descriptor length
  //     0x02,                                                                               // service_type
  //     0x0d, 0x76, 0x75, 0x6c, 0x6e, 0x65, 0x72, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, // provider with 1 first byte showing its length
  //     0x05, 0x66, 0x6f, 0x75, 0x6e, 0x64,                                                 // service with 1 first byte showing its length
  // };
  // size_t len = sizeof(sdt_data);

  u32 len = (u32)getNumberInRange(5, 1000);
  u8 *sdt_data = (u8 *)getRandomByteStream(len);

  gf_m2ts_process_sdt(sdt_data, len);
  free(sdt_data);
}
