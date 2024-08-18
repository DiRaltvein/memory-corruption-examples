// https://www.cvedetails.com/cve/CVE-2023-39351/
// repository: https://github.com/FreeRDP/FreeRDP
// commit: 63a2f65
// extract of: libfreerdp/codec/rfx.c (function: rfx_process_message)

// test was run with --malloc-never-fails flags removed

#include <stdlib.h>

typedef struct {
  int numTiles;
  int *tiles;
} RFX_MESSAGE;

void rfx_allocate_tiles(RFX_MESSAGE *message, size_t count) {
  int *tmpTiles = calloc(count, sizeof(int));
  if (!tmpTiles && (count != 0))
    return;
  message->tiles = tmpTiles;
}

int rfx_message_get_tile(RFX_MESSAGE *message, int index) {
  return message->tiles[index]; // Problem: access of null pointer
}

int main(int argc, char *argv[]) {
  RFX_MESSAGE message = {0};
  message.numTiles = argc;

  rfx_allocate_tiles(&message, message.numTiles);

  for (int i = 0; i < message.numTiles; i++) {
    rfx_message_get_tile(&message, i);
  }

  if (message.tiles != NULL) {
    free(message.tiles);
  }
}
