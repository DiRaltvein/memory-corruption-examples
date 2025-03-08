// https://www.cvedetails.com/cve/CVE-2022-47659/
// repository: https://github.com/gpac/gpac
// commit: 2bcc36b
// extract of: src/utils/bitstream.c (function: gf_bs_read_data)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  unsigned char *data;
  size_t position;
  size_t size;
} GF_BitStream;

uint8_t gf_bs_read_int(GF_BitStream *bs) {
  return bs->data[bs->position++];
}

size_t gf_bs_available(GF_BitStream *bs) {
  return bs->size - bs->position;
}

uint32_t gf_bs_read_data(GF_BitStream *bs, uint8_t *data, uint32_t nbBytes) {
  uint64_t orig = bs->position;

  if (bs->position + nbBytes > bs->size)
    return 0;

  while (nbBytes-- > 0) {
    *data++ = gf_bs_read_int(bs); // Problem: stack buffer overflow of latm_buffer
  }
  return (uint32_t)(bs->position - orig);
}

void latm_dmx_sync_frame_bs(GF_BitStream *bs, uint32_t *nb_bytes, uint8_t *buffer) {
  uint32_t size = 0;

  while (gf_bs_available(bs) > 0) {
    uint32_t tmp = gf_bs_read_int(bs);
    size += tmp;
    if (tmp != 255)
      break;
  }
  if (gf_bs_available(bs) < size) {
    return;
  }

  if (nb_bytes) {
    *nb_bytes = (uint32_t)size; // size is over written even through buffer is fixed to nb_bytes size
  }

  if (buffer) {
    uint32_t readSize = gf_bs_read_data(bs, buffer, size); // function is given wrong size that does not correspond to buffer size
    if (readSize > 0) {
      printf("Read data: %s\n", buffer);
    }
  } else {
    while (size) {
      gf_bs_read_int(bs);
      size--;
    }
  }
}

int main() {
  unsigned char data[] = "\x58The golden sun dips below the horizon, painting the sky in hues of fire and gentle rose.";
  GF_BitStream bs = {0};
  bs.position = 0;
  bs.data = (unsigned char *)data;
  bs.size = sizeof(data) / sizeof(data[0]);

  uint8_t latm_buffer[64] = {0};
  uint32_t latm_frame_size = 64;

  latm_dmx_sync_frame_bs(&bs, &latm_frame_size, latm_buffer);
}
