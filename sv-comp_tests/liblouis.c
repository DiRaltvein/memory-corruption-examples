// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 Roman Amjaga
//
// SPDX-License-Identifier: Apache-2.0

// https://www.cvedetails.com/cve/CVE-2023-26768/
// repository: https://github.com/liblouis/liblouis
// commit: 517f6f1
// extract of: liblouis/logging.c (function: lou_logFile)

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <stdlib.h>
#include "helpers.c"

FILE *logFile = NULL;
char initialLogFileName[256] = {0};

void lou_logFile(const char *fileName) {
	if (logFile) {
		fclose(logFile);
		logFile = NULL;
	}
	if (fileName == NULL || fileName[0] == 0) return;
	strcpy(initialLogFileName, fileName); // Problem: copy of randomString value into a buffer with fixed length of 256
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
