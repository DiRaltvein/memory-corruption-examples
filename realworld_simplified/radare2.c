// https://www.cvedetails.com/cve/CVE-2021-32495/
// repository: https://github.com/radareorg/radare2
// commit: a07dedb
// extract of: libr/bin/format/pyc/marshal.c (function: get_object)

#include <stdlib.h>

typedef struct {
  void *data;
  int type;
} pyc_object;

typedef struct r_list_iter_t {
  void *data;
} RListIter;

RListIter *r_list_append(void *data) {
  RListIter *item = malloc(sizeof(RListIter));
  item->data = data;
  return item;
}

pyc_object *copy_object(pyc_object *object) {
  pyc_object *copy = malloc(sizeof(pyc_object));
  copy->type = object->type; // Problem: use after free
  return copy;
}

int main(int argc, char *argv[]) {
  pyc_object *ret = NULL;
  RListIter *ref_idx = NULL;

  ret = malloc(sizeof(pyc_object));
  ret->type = 5;
  ref_idx = r_list_append(ret);

  switch (argc) {
  case 1:
  case 2:
    // nop
    break;
  default:
    free(ret);
    free(ref_idx);
    return 0;
  }

  free(ref_idx->data);              // free of ret that is stored in ref_idx->data pointer
  ref_idx->data = copy_object(ret); // ret pointer is already freed and it is used to create a copy of that object

  free(ref_idx);
}
