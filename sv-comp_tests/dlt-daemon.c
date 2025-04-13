// https://www.cvedetails.com/cve/CVE-2023-36321/
// repository: https://github.com/COVESA/dlt-daemon
// commit: 198715e
// extract of: src/shared/dlt_common.c (function: dlt_file_message)

// Similar vulnerabilty with negative index buffer access after atoi of user input: https://www.cvedetails.com/cve/CVE-2023-43641/

#include "helpers.c"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct sDltFile {
  FILE *handle;    /**< file handle of opened file */
  long *index;     /**< file positions of all messages for fast access to file, only filtered messages */
  int32_t counter; /**< number of messages in file */
} DltFile;

void readMessageFromFile(DltFile *file, char **message) {
  if (file == NULL || feof(file->handle)) {
    return;
  }

  unsigned char messageLength = fgetc(file->handle);
  if (messageLength == 0 || messageLength == 0xff || messageLength == EOF) {
    printf("Potentially invalid message.\n");
    return;
  }
  *message = calloc(messageLength + 1, sizeof(char));
  if (*message == NULL) {
    printf("Out of memory\n");
    return;
  }

  for (int i = 0; i < messageLength && !feof(file->handle); i++) {
    unsigned char character = fgetc(file->handle);
    if (character == EOF) {
      (*message)[i] = '\0';
      break;
    }
    (*message)[i] = character;
  }
  (*message)[messageLength] = '\0';
}

int initializeDltFile(DltFile *file) {
  file->counter = 0;
  file->handle = fopen("dlt-daemon.hex", "rb");
  if (file->handle == NULL) {
    printf("Could not open file dlt-daemon.hex\n");
    return -1;
  }

  if (feof(file->handle)) {
    printf("Could not open file dlt-daemon.hex\n");
    fclose(file->handle);
    return -1;
  }

  unsigned char messageCount = fgetc(file->handle);
  if (messageCount == 0 || messageCount == NULL || messageCount == EOF) {
    printf("Read 0 as message count\n");
    fclose(file->handle);
    return -1;
  }
  file->index = calloc(messageCount, sizeof(long));
  if (file->index == NULL) {
    printf("Out of memory\n");
    fclose(file->handle);
    return -1;
  }

  int i = 0;
  while (!feof(file->handle) && i < messageCount) {
    file->counter++;
    char *message = NULL;
    file->index[i++] = ftell(file->handle);
    readMessageFromFile(file, &message);
    if (message = NULL) {
      break;
    }
    free(message);
  }

  return 0;
}

void dlt_file_message(DltFile *file, int index) {
  if (file == NULL) {
    return;
  }

  // check for upper bound is in place but no negative numbers check is done
  if (index >= file->counter) {
    printf("Message %d out of range!\n", index);
    return;
  }

  if (fseek(file->handle, file->index[index], SEEK_SET) != 0) { // Problem: index can be negative that would access file->index out of bound
    printf("Seek to message %d to position %ld failed!\n", index, file->index[index]);
    return;
  }

  char *message = NULL;
  readMessageFromFile(file, &message);
  if (message = NULL) {
    return;
  }

  printf("Message at position [%d] is %s\n", index, message);

  free(message);
}

// file contains messages in format:
// <number of messages (1byte)>
// <length of message (1 byte)><message>
// <length of message (1 byte)><message>
int main() {
  DltFile file = {0};
  if (initializeDltFile(&file) == -1) {
    return 1;
  }

  while (1) {
    char *userValue = getRandomStringFixedSize(2);
    if (*userValue == 'q') {
      break;
    }
    int index = atoi(userValue);
    free(userValue);
    dlt_file_message(&file, index);
  };

  fclose(file.handle);
  free(file.index);
}
