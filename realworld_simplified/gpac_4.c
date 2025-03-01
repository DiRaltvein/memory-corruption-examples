// https://www.cvedetails.com/cve/CVE-2023-3012/
// repository: https://github.com/gpac/gpac
// commit: 8f3088b
// extract of: src/utils/xml_parser.c (function: xml_sax_append_string)

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  char *name;
  char *value;
} XML_Entity;

typedef struct {
  char *buffer;
  uint32_t alloc_size;
  uint32_t current_pos;

  XML_Entity *entities;
  uint32_t entryCount;
} GF_SAXParser;

static int xml_sax_append_string(GF_SAXParser *parser, char *string) {
  uint32_t nl_size = (uint32_t)strlen(string); // Problem: string may be NULL pointer

  if (!nl_size)
    return 0;

  if (parser->alloc_size < parser->current_pos + nl_size + 2) {
    parser->alloc_size = parser->current_pos + nl_size + 2;
    parser->buffer = (char *)realloc(parser->buffer, sizeof(char) * parser->alloc_size);
    if (!parser->buffer)
      return 1;
  }

  memcpy(parser->buffer + parser->current_pos, string, sizeof(char) * nl_size);
  parser->current_pos += nl_size;
  parser->buffer[parser->current_pos++] = ' ';
  parser->buffer[parser->current_pos + 1] = '\0';
  return 0;
}

static void gf_xml_sax_parse_intern(GF_SAXParser *parser) {
  uint32_t count = parser->entryCount;
  for (size_t i = 0; i < count; i++) {
    XML_Entity ent = parser->entities[i];
    xml_sax_append_string(parser, ent.value); // ent.value may be null in case pair value is not given
  }
}

XML_Entity *add_new_entry(GF_SAXParser *parser) {
  if (parser->entryCount == 0) {
    parser->entities = calloc(1, sizeof(XML_Entity));
    if (parser->entities == NULL) {
      printf("Out of memory\n");
      exit(1);
    }
    parser->entryCount = 1;
    return &parser->entities[0];
  }
  XML_Entity *temp = realloc(parser->entities, ++parser->entryCount * sizeof(XML_Entity));
  if (temp == NULL) {
    free(parser->entities);
    printf("Out of memory\n");
    exit(1);
  }
  parser->entities = temp;
  return &parser->entities[parser->entryCount - 1];
}

void parse_entities(GF_SAXParser *parser, char *data) {
  parser->entryCount = 0;

  char *pairp = strtok(data, "\n");
  while (pairp != NULL) {
    char *separator = strchr(pairp, '=');
    if (separator != NULL) {
      *separator = '\0';
      XML_Entity *ent = add_new_entry(parser);
      ent->name = pairp;
      if (*(separator + 1) && *(separator + 1) != '\n') {
        ent->value = separator + 1;
      }
    }
    pairp = strtok(NULL, "\n");
  }
}

int main() {
  char data[] = "json=value\njson2=\njson3=value3\njson4=value4";

  GF_SAXParser parser = {0};
  parser.buffer = calloc(100, sizeof(char));
  if (parser.buffer == NULL) {
    printf("Out of memory\n");
    return 1;
  }
  parser.alloc_size = 100;
  parser.current_pos = 0;

  parse_entities(&parser, (char *)data);
  gf_xml_sax_parse_intern(&parser);
  printf("All pair values combined: %s\n", parser.buffer);

  if (parser.entities) {
    free(parser.entities);
  }
  free(parser.buffer);
}
