// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2021-32495/
// repository: https://github.com/radareorg/radare2
// commit: a07dedb
// extract of: libr/bin/format/pyc/marshal.c (function: get_object)

#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include "helpers.c"

#define R_NEW0(x) (x*)calloc(1,sizeof(x))
#define R_NEW(x) (x*)malloc(sizeof(x))
#define R_FREE(x) { free((void *)x); x = NULL; }
#define FLAG_REF '\x80'

typedef unsigned char ut8;

typedef enum {
	TYPE_FALSE = 'F',
	TYPE_INT = 'i',
	TYPE_NONE = 'N',
	TYPE_TRUE = 'T',
} pyc_marshal_type;

typedef struct {
	pyc_marshal_type type;
	void *data;
} pyc_object;

typedef struct r_list_iter_t {
	pyc_object *data;
} RListIter;

typedef struct r_buf_t {
	char *data;
	size_t len;
	size_t offset;
} RBuffer;

static ut8 get_ut8(RBuffer *buffer, bool *error) {
	if (buffer->offset + 1 > buffer->len) {
		*error = true;
		return 0;
	}
	return (ut8)buffer->data[buffer->offset++];
}

static int get_st32(RBuffer *buffer, bool *error) {
	if (buffer->offset + sizeof(int) > buffer->len) {
		*error = true;
		return 0;
	}
	int st32;
	memcpy(&st32, buffer->data + buffer->offset, sizeof(int));
	buffer->offset += sizeof(int);
	return st32;
}

static void free_object(pyc_object *object) {
	if (!object) {
		return;
	}
	if (object->data) {
		free(object->data);
	}
	free(object);
}

static pyc_object *get_none_object(void) {
	pyc_object *ret;

	ret = R_NEW0 (pyc_object);
	if (!ret) {
		return NULL;
	}
	ret->type = TYPE_NONE;
	ret->data = strdup("None");
	if (!ret->data) {
		R_FREE (ret);
	}
	return ret;
}

static pyc_object *get_false_object(void) {
	pyc_object *ret = R_NEW0 (pyc_object);
	if (!ret) {
		return NULL;
	}
	ret->type = TYPE_FALSE;
	ret->data = strdup("False");
	if (!ret->data) {
		R_FREE (ret);
	}
	return ret;
}

static pyc_object *get_true_object(void) {
	pyc_object *ret = R_NEW0 (pyc_object);
	if (!ret) {
		return NULL;
	}
	ret->type = TYPE_TRUE;
	ret->data = strdup("True");
	if (!ret->data) {
		R_FREE (ret);
	}
	return ret;
}

static pyc_object *get_int_object(RBuffer *buffer) {
	bool error = false;
	pyc_object *ret = NULL;

	int i = get_st32(buffer, &error);
	if (error) {
		return NULL;
	}
	ret = R_NEW0 (pyc_object);
	if (!ret) {
		return NULL;
	}
	ret->type = TYPE_INT;
	int length = snprintf(NULL, 0, "%d", i);
	ret->data = malloc(length + 1);
	if (!ret->data) {
		R_FREE (ret);
		return NULL;
	}
	snprintf((char*)ret->data, length + 1, "%d", i);
	return ret;
}

RListIter *r_list_append(pyc_object *data) {
	RListIter *item = NULL;

	item = R_NEW (RListIter);
	if (!item) {
		return item;
	}
	item->data = data;
	return item;
}

static pyc_object *get_object(RBuffer *buffer) {
	bool error = false;
	pyc_object *ret = NULL;
	ut8 code = get_ut8(buffer, &error);
	ut8 flag = code & FLAG_REF;
	RListIter *ref_idx = NULL;
	ut8 type = code & ~FLAG_REF;

	if (error) {
		return NULL;
	}

	if (flag) {
		ret = get_none_object();
		if (!ret) {
			return NULL;
		}
		ref_idx = r_list_append(ret);
		if (!ref_idx) {
			free_object (ret);
			return NULL;
		}
	}

	switch (type) {
	case TYPE_TRUE:
		free_object(ret);
		free(ref_idx);
		return get_true_object();
	case TYPE_FALSE:
		free_object(ret);
		free(ref_idx);
		return get_false_object();
	case TYPE_NONE:
		free_object(ret);
		free(ref_idx);
		return get_none_object();
	case TYPE_INT:
		ret = get_int_object(buffer);
		break;
	case 1:
		// nop
		break;
	default:
		printf("Undefined type in get_object (0x%x)\n", type);
		free_object(ret);
		free(ref_idx);
		return NULL;
	}

	if (flag && ref_idx) {
		free_object(ref_idx->data); // Problem: free of ret object that is returned from function
		ref_idx->data = get_none_object();
	}

	if (ref_idx && ref_idx->data) {
		printf("Object type: 0x%x\n", ref_idx->data->type);
		free_object(ref_idx->data);
	}
	free(ref_idx);

	return ret;
}

int main() {
	char* data = getRandomStringFixedSize(10);

	RBuffer buffer = {0};
	buffer.data = data;
	buffer.len = 10;
	buffer.offset = 0;
	
	pyc_object* obj = get_object(&buffer);
	if (obj != NULL) {
		printf("Object type: 0x%x\n", obj->type); // Problem: potential use of freed pointer
		if (obj->type == TYPE_INT) {
			printf("Extracted number: %s\n", (char*)obj->data);
		}
		free_object(obj);
	}

  free(data);
}
