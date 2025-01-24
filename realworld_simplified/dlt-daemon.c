// https://www.cvedetails.com/cve/CVE-2023-36321/
// repository: https://github.com/COVESA/dlt-daemon
// commit: 198715e
// extract of: src/shared/dlt_common.c (function: dlt_file_message)

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

typedef struct sDltFile
{
  FILE *handle;      /**< file handle of opened file */
  long *index;       /**< file positions of all messages for fast access to file, only filtered messages */
  int32_t counter;       /**< number of messages in file */
} DltFile;

void readMessageFromFile(DltFile *file, char** message) {
  if (file == NULL || feof(file->handle)) {
    exit(1);
  }

  unsigned char messageLength = fgetc(file->handle);
  if (messageLength == 0 || messageLength == 0xff) {
    printf("Potentially invalid message.\n");
    exit(1);
  }
  *message = calloc(messageLength + 1, sizeof(char));
  if (*message == NULL) {
    printf("Out of memory\n");
    exit(1);
  }

  for (int i = 0; i < messageLength && !feof(file->handle); i++) {
    (*message)[i] = fgetc(file->handle);
  }
  (*message)[messageLength] = '\0';
}

void initializeDltFile(DltFile *file) {
  file->counter = 0;
  file->handle = fopen("dlt-daemon.hex", "rb");
  if (file->handle == NULL || feof(file->handle)) {
    printf("Could not open file dlt-daemon.hex\n");
    exit(1);
  }

  unsigned char messageCount = fgetc(file->handle);
  if (messageCount == 0) {
    printf("Read 0 as message count\n");
    exit(1);
  }
  file->index = calloc(messageCount, sizeof(long));
  if (file->index == NULL) {
    printf("Out of memory\n");
    exit(1);
  }

  int i = 0;
  while (!feof(file->handle) && i < messageCount) {
    file->counter++;
    char* message;
    file->index[i++] = ftell(file->handle);
    readMessageFromFile(file, &message);
    free(message);
  }
}

void dlt_file_message(DltFile *file, int index) {
  if (file == NULL) {
    exit(1);
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

  char* message;
  readMessageFromFile(file, &message);

  printf("Message at position [%d] is %s\n", index, message);

  free(message);
}

// file contains messages in format:
// <number of messages (1byte)>
// <length of message (1 byte)><message>
// <length of message (1 byte)><message>
int main() {
  DltFile file = {0};
  initializeDltFile(&file);

  // There is a problem with all this reading as negative indexes are not checked and read out of bound is possible with negative numebrs
  printf("Input a number that would correspond to an index of a message in hex file to see the message on that position. Alternatively input 'q' to stop the program.\n");
  while (1) {
    char userValue[5] = {0};
    scanf("%4s", (char*)&userValue);
    if (userValue[0] == 'q') {
      break;
    }
    dlt_file_message(&file, atoi(userValue));
  };

  fclose(file.handle);
  free(file.index);
}
