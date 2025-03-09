// https://www.cvedetails.com/cve/CVE-2023-36243/
// repository: https://github.com/noirotm/flvmeta
// commit: 1c9cee8
// extract of: src/dump_xml.c (function: xml_on_metadata_tag_only)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define AMF_TYPE_NUMBER ((byte)0x00)
#define AMF_TYPE_BOOLEAN ((byte)0x01)
#define AMF_TYPE_STRING ((byte)0x02)
typedef unsigned char byte;

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

/**
 * Just a utility function in test creation that generates random string of specified size
 */
char *getRandomString(int lowestSize, int highestSize) {
  int stringSize = __VERIFIER_nondet_int();
  while (stringSize < lowestSize || stringSize > highestSize) {
    stringSize = __VERIFIER_nondet_int();
  }

  char *randomString = (char*)calloc(stringSize + 1, sizeof(char));
  if (randomString == NULL) {
    printf("Out of memory\n");
    exit(1);
  }
  for (int i = 0; i < stringSize; i++) {
    randomString[i] = __VERIFIER_nondet_char();
  }
  randomString[stringSize] = '\0';
  return randomString;
}

typedef struct __flv_parser {
  byte *stream;
  unsigned int stream_size;
  unsigned int currect_stream_position;
} flv_parser;

typedef struct __amf_data {
  byte type;
  byte error_code;
  byte *string_data;
  int32_t number_data;
  byte boolean_data;
} amf_data;

byte *amf_string_get_bytes(const amf_data *data) {
  return (data != NULL) ? data->string_data : NULL;
}

void xml_on_metadata_tag_only(amf_data *name) {
  if (!strcmp((char *)amf_string_get_bytes(name), "onMetaData")) { // Problem: code expects tag data to be string but it can acually be another type
    printf("Tag section name is onMetaData");                      // in case amf_data type is not a string strcmp will be called with a zero page pointer
  } else if (!strcmp((char *)amf_string_get_bytes(name), "Hello")) {
    printf("Tag section name is Hello");
  }
}

amf_data *amf_number_read(flv_parser *parser) {
  if (parser->currect_stream_position >= parser->stream_size) {
    return NULL;
  }
  int32_t val = parser->stream[parser->currect_stream_position++];
  amf_data *data = (amf_data *)calloc(1, sizeof(amf_data));
  if (data != NULL) {
    data->type = AMF_TYPE_NUMBER;
    data->number_data = val;
  }
  return data;
}

amf_data *amf_boolean_read(flv_parser *parser) {
  if (parser->currect_stream_position >= parser->stream_size) {
    return NULL;
  }
  byte val = parser->stream[parser->currect_stream_position++];
  amf_data *data = (amf_data *)calloc(1, sizeof(amf_data));
  if (data != NULL) {
    data->type = AMF_TYPE_BOOLEAN;
    data->boolean_data = val;
  }
  return data;
}

amf_data *amf_string_read(flv_parser *parser) {
  if (parser->currect_stream_position >= parser->stream_size) {
    return NULL;
  }

  byte strsize = parser->stream[parser->currect_stream_position++];
  if (parser->currect_stream_position + strsize - 1 >= parser->stream_size) {
    return NULL;
  }
  amf_data *data = (amf_data *)calloc(1, sizeof(amf_data));
  if (data == NULL) {
    return NULL;
  }
  data->type = AMF_TYPE_STRING;
  data->string_data = (byte *)calloc(strsize + 1, sizeof(byte));
  if (data->string_data == NULL) {
    free(data);
    return NULL;
  }

  if (strsize == 0) {
    return data;
  }

  memcpy(data->string_data, parser->stream + parser->currect_stream_position, strsize);
  parser->currect_stream_position += strsize;
  return data;
}

amf_data *amf_data_read(flv_parser *parser) {
  if (parser->currect_stream_position >= parser->stream_size) {
    return NULL;
  }
  byte type = parser->stream[parser->currect_stream_position++];
  switch (type) {
  case AMF_TYPE_NUMBER:
    return amf_number_read(parser);
  case AMF_TYPE_BOOLEAN:
    return amf_boolean_read(parser);
  case AMF_TYPE_STRING:
    return amf_string_read(parser);
  }
  return NULL;
}

// Parsing of a simplified FLV (Flash Video) files.
int main() {
  // byte flvFileMock[] = {
  //     0x12,                                                             // tag
  //     0x02,                                                             // data type of tag value (in this case a string)
  //     0x0A, 0x6f, 0x6e, 0x4d, 0x65, 0x74, 0x61, 0x44, 0x61, 0x74, 0x61, // string data that equals to onMetaData (1 byte shows the string length)

  //     0x12, // tag
  //     0x00, // data type of tag value (in this case a number)
  //     0x48  // number 72
  // };

  byte *flvFileMock = getRandomString(5, 500);

  flv_parser parser = {0};
  parser.stream = calloc(1, sizeof(flvFileMock));
  if (parser.stream == NULL)
    return 1;
  memcpy(parser.stream, flvFileMock, sizeof(flvFileMock));
  parser.currect_stream_position = 0;
  parser.stream_size = sizeof(flvFileMock);

  uint8_t tag;
  amf_data *name;
  while (parser.currect_stream_position < parser.stream_size) {
    tag = parser.stream[parser.currect_stream_position++];
    name = amf_data_read(&parser);
    if (name == NULL) {
      free(parser.stream);
      free(flvFileMock);
      return 1;
    }
    if (tag == 0x12) {
      xml_on_metadata_tag_only(name);
    } else {
      printf("Skipping section with tag 0x%.2X", tag);
    }
    free(name);
  }
  free(parser.stream);
  free(flvFileMock);
}
