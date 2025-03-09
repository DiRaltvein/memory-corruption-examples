// https://www.cvedetails.com/cve/CVE-2023-29596/
// repository: https://github.com/byronknoll/cmix
// commit: 24bf476
// extract of: src/models/paq8.cpp (function: ConvertUTF8)

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_WORD_SIZE 64
typedef unsigned char u8;

extern char __VERIFIER_nondet_char(void);
extern int __VERIFIER_nondet_int(void);

typedef struct _Word {
  u8 Letters[MAX_WORD_SIZE];
  u8 Start, End;
} Word;

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

bool IsVowel(const u8 c) {
  int NUM_VOWELS = 6;
  u8 Vowels[] = {'a', 'e', 'i', 'o', 'u', 'y'};

  for (int i = 0; i < NUM_VOWELS; i++) {
    if (c == Vowels[i])
      return true;
  }

  return false;
}

void ConvertUTF8(Word *W) {
  for (int i = W->Start; i < W->End; i++) {
    u8 c = W->Letters[i + 1] + ((W->Letters[i + 1] < 0xA0) ? 0x60 : 0x40);
    if (W->Letters[i] == 0xC3 && IsVowel(c)) {
      W->Letters[i] = c;
      if (i + 1 < W->End) {
        memcpy(&W->Letters[i + 1], &W->Letters[i + 2], W->End - i - 1); // Problem: overlapping memcpy memory
      W->End--;
      }
    }
  }
}

int main() {
  Word word = {0};
  // u8 input[] = {
  //     0x68,
  //     0xC3, 0x05, // e
  //     0x6c,
  //     0x6c,
  //     0xC3, 0x0F, // o
  //     0x20,
  //     0x77,
  //     0xC3, 0x0F, // o
  //     0x72,
  //     0x6c,
  //     0x64,
  //     0x21,
  //     '\0'};
  // memcpy(word.Letters, input, sizeof(input));
  u8 *randomString = (u8*)getRandomString(5, 50);
  memcpy(word.Letters, randomString, sizeof(randomString));
  free(randomString);
  word.Start = 0;
  word.End = strlen((char *)word.Letters);

  ConvertUTF8(&word);
  printf("Converted: %s\n", word.Letters);
}
