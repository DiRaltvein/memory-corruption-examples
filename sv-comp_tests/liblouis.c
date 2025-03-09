// https://www.cvedetails.com/cve/CVE-2023-26768/
// repository: https://github.com/liblouis/liblouis
// commit: 517f6f1
// extract of: liblouis/logging.c (function: lou_logFile)

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>

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

FILE *logFile = NULL;
char initialLogFileName[256] = "";

void lou_logFile(const char *fileName) {
	if (logFile) {
		fclose(logFile);
		logFile = NULL;
	}
	if (fileName == NULL || fileName[0] == 0) return;
	if (initialLogFileName[0] == 0) strcpy(initialLogFileName, fileName); // Problem: copy of argv[1] value into a buffer with fixed length of 256
	logFile = fopen(fileName, "a");
	if (logFile == NULL && initialLogFileName[0] != 0)
		logFile = fopen(initialLogFileName, "a");
	if (logFile == NULL) {
		fprintf(stderr, "Cannot open log file %s\n", fileName);
		logFile = stderr;
	}
}

void lou_logPrint(const char *format, ...) {
	va_list argp;
	if (format == NULL) return;
	if (logFile == NULL) logFile = fopen(initialLogFileName, "a");
	if (logFile == NULL) logFile = stderr;
	va_start(argp, format);
	vfprintf(logFile, format, argp);
	fprintf(logFile, "\n");
	fflush(logFile);
	va_end(argp);
}

void lou_logEnd(void) {
	if (logFile != NULL && logFile != stderr) fclose(logFile);
	logFile = NULL;
}

int main() {
	char* randomString = getRandomString(5, 300);
  lou_logFile(randomString);
  lou_logPrint("Error: buffer overflow of buffer %s if passed logFile is %d characters or longer", initialLogFileName, 256);
  lou_logEnd();
	free(randomString);
}
