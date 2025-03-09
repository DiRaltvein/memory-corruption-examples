// https://www.cvedetails.com/cve/CVE-2023-46256/
// repository: https://github.com/PX4/PX4-Autopilot
// commit: 3c129ae
// extract of: src/drivers/distance_sensor/lightware_laser_serial/parser.cpp (function: lightware_parser)

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

enum LW_PARSE_STATE {
	LW_PARSE_STATE0_UNSYNC = 0,
	LW_PARSE_STATE1_SYNC,
	LW_PARSE_STATE2_GOT_DIGIT0,
	LW_PARSE_STATE3_GOT_DOT,
	LW_PARSE_STATE4_GOT_DIGIT1,
	LW_PARSE_STATE5_GOT_DIGIT2,
	LW_PARSE_STATE6_GOT_CARRIAGE_RETURN
};

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

// function parses float with 2 values after point.
int lightware_parser(char c, char *parserbuf, unsigned *parserbuf_index, enum LW_PARSE_STATE *state)
{
	int ret = -1;

	switch (*state) {
	case LW_PARSE_STATE0_UNSYNC:
		if (c == '\n') {
			*state = LW_PARSE_STATE1_SYNC;
			(*parserbuf_index) = 0;
		}
  
		break;
	case LW_PARSE_STATE1_SYNC:
		if (c >= '0' && c <= '9') {
			*state = LW_PARSE_STATE2_GOT_DIGIT0;
			parserbuf[*parserbuf_index] = c;
			(*parserbuf_index)++;
		}

		break;
	case LW_PARSE_STATE2_GOT_DIGIT0:
		if (c >= '0' && c <= '9') {
			*state = LW_PARSE_STATE2_GOT_DIGIT0;
			parserbuf[*parserbuf_index] = c; // Problem: the state LW_PARSE_STATE2_GOT_DIGIT0 can loop infinetly in and because there is no parserbuf_index checks buffer overflow can happen
			(*parserbuf_index)++;

		} else if (c == '.') {
			*state = LW_PARSE_STATE3_GOT_DOT;
			parserbuf[*parserbuf_index] = c;
			(*parserbuf_index)++;

		} else {
			*state = LW_PARSE_STATE0_UNSYNC;
		}

		break;
	case LW_PARSE_STATE3_GOT_DOT:
		if (c >= '0' && c <= '9') {
			*state = LW_PARSE_STATE4_GOT_DIGIT1;
			parserbuf[*parserbuf_index] = c;
			(*parserbuf_index)++;

		} else {
			*state = LW_PARSE_STATE0_UNSYNC;
		}

		break;
	case LW_PARSE_STATE4_GOT_DIGIT1:
		if (c >= '0' && c <= '9') {
			*state = LW_PARSE_STATE5_GOT_DIGIT2;
			parserbuf[*parserbuf_index] = c;
			(*parserbuf_index)++;

		} else {
			*state = LW_PARSE_STATE0_UNSYNC;
		}

		break;
	case LW_PARSE_STATE5_GOT_DIGIT2:
		if (c == '\r') {
			*state = LW_PARSE_STATE6_GOT_CARRIAGE_RETURN;

		} else {
			*state = LW_PARSE_STATE0_UNSYNC;
		}

		break;
	case LW_PARSE_STATE6_GOT_CARRIAGE_RETURN:
		if (c == '\n') {
			parserbuf[*parserbuf_index] = '\0';
			*state = LW_PARSE_STATE1_SYNC;
			*parserbuf_index = 0;
			ret = 0;

		} else {
			*state = LW_PARSE_STATE0_UNSYNC;
		}

		break;
	}

	return ret;
}

int main() {
  // char stringToParse[] = "some random data\n951.23\r\nand some random data af\n543331443.32\r\nter\n";
	char *stringToParse = getRandomString(5, 500);

  // buffer for result
  char parserbuf[10];
  unsigned int parserbuf_index;

  enum LW_PARSE_STATE state = LW_PARSE_STATE0_UNSYNC;

  for (size_t i = 0; i < strlen(stringToParse); i++) {
    if (lightware_parser(stringToParse[i], (char*)parserbuf, &parserbuf_index, &state) == 0) {
      printf("Float parsed: %s\n", parserbuf);
    }
  }
}
