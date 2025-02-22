// https://www.cvedetails.com/cve/CVE-2023-31567/
// repository: https://github.com/podofo/podofo
// commit: 90ccd75
// extract of: src/podofo/main/PdfEncrypt.cpp (function: PdfEncryptAESV3::PdfEncryptAESV3)

// same problem as https://www.cvedetails.com/cve/CVE-2023-31568/

#include <stdlib.h>
#include <string.h>
#include <map>
#include <stdio.h>

unsigned char m_oValue[49] = {0};
unsigned char m_uValue[49] = {0};
unsigned char m_rValue[49] = {0};

char *getKey(std::map<char, char*>* m_Map, const char key) {
  auto it = m_Map->find(key);
  if (it == m_Map->end())
    return nullptr;
  return it->second;
}

void freeMap(std::map<char, char*> *m_Map) {
  for (auto a : *m_Map) {
    if (a.second) {
      free(a.second);
    }
  }
}

int main() {
  std::map<char, char*> m_Map;
  char data[] = "/O <hZvCeqRm57TSnkKQdVAztxbyGfEXjP6HWUw2B9pNc3sL4aJ8>/U <RFHS6P8zUteEX7svmfhCwjxkKQbLG4dyJM92ZYDWNnq3pVB5>/R <Some random value>";
  char* datap = (char*)data;
  size_t dataSize = strlen(datap);
  char* dataEnd = data + dataSize;

  while(datap < dataEnd) {
    if (datap + 3 >= dataEnd) {
      printf("malformed data\n");
      freeMap(&m_Map);
      return 1;
    }
    char identifier = datap[1];
    datap += 3;
    if (*datap != '<') {
      printf("malformed data\n");
      freeMap(&m_Map);
      return 1;
    }
    datap += 1;
    char* valueEnd = datap;
    while (valueEnd < dataEnd && *valueEnd != '>') {
      valueEnd++;
    }
    size_t valueSize = valueEnd - datap;
    if (valueSize > 0) {
      char* value = (char*)calloc(valueSize + 1, sizeof(char));
      memcpy(value, datap, valueSize);
      m_Map[identifier] = value;
    }
    datap += valueSize + 1;
  }

  auto oValue = getKey(&m_Map, 'O');
  if (oValue) {
    memcpy(m_oValue, oValue, 48);
    printf("extracted O value: %s\n", m_oValue);
  }

  auto uValue = getKey(&m_Map, 'U');
  if (uValue) {
    memcpy(m_uValue, uValue, 48);
    printf("extracted U value: %s\n", uValue);
  }

  auto rValue = getKey(&m_Map, 'R');
  if (rValue) {
    memcpy(m_rValue, rValue, 48); // Problem: extracted R value length is less than 48 resulting is read out of bound for buffer rValue
    printf("extracted R value: %s\n", rValue);
  }

  freeMap(&m_Map);
}
