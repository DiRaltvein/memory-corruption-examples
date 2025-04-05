// https://www.cvedetails.com/cve/CVE-2022-29021/
// repository: https://github.com/openrazer/openrazer
// commit: 9991fc6
// extract of: driver/razerchromacommon.c (function: razer_chroma_extended_matrix_set_custom_frame2)

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define fallthrough __attribute__((__fallthrough__))

struct razer_report {
  unsigned char data_size;
  unsigned char command_class;
  unsigned char arguments[80];
};

struct razer_report get_razer_report(unsigned char command_class, unsigned char data_size) {
  struct razer_report new_report = {0};
  memset(&new_report, 0, sizeof(struct razer_report));

  new_report.command_class = command_class;
  new_report.data_size = data_size;

  return new_report;
}

struct razer_report razer_chroma_extended_matrix_set_custom_frame2(unsigned char row_index, unsigned char start_col, unsigned char stop_col, unsigned char *rgb_data) {
  const size_t row_length = (size_t)(((stop_col + 1) - start_col) * 3);
  struct razer_report report = get_razer_report(0x0F, 0x03);

  report.arguments[0] = 'R';
  report.arguments[2] = row_index;
  report.arguments[3] = start_col;
  report.arguments[4] = stop_col;
  memcpy(&report.arguments[5], rgb_data, row_length); // Problem: overflow of report.arguments buffer because no check is done whether row_length fits into 80 char buffer

  return report;
}

static void razer_send_payload(struct razer_report *request_report) {
  printf("rgb data: %s\n", &request_report->arguments[5]);
}

int main() {
  const char buf[] = "\x00\x00\x02rgb000rgb\x00\x00\x19rgb000000000000000000000000000000000000000000000000000000000000000000000000000\x00\x00\x02rgb000000";
  size_t count = (sizeof(buf) / sizeof(buf[0])) - 1;

  struct razer_report report = {0};
  size_t offset = 0;
  unsigned char row_id;
  unsigned char start_col;
  unsigned char stop_col;
  size_t row_length;

  while (offset < count) {
    if (offset + 3 > count) {
      printf("razerkbd: Wrong Amount of data provided: Should be ROW_ID, START_COL, STOP_COL, N_RGB\n");
      break;
    }

    row_id = buf[offset++];
    start_col = buf[offset++];
    stop_col = buf[offset++];

    if (start_col > stop_col) {
      printf("razerkbd: Start column is greater than end column\n");
      break;
    }

    row_length = ((stop_col + 1) - start_col) * 3;

    if (offset + row_length > count) {
      printf("razerkbd: Not enough RGB to fill row\n");
      break;
    }

    report = razer_chroma_extended_matrix_set_custom_frame2(row_id, start_col, stop_col, (unsigned char *)&buf[offset]);
    razer_send_payload(&report);

    // *3 as its 3 bytes per col (RGB)
    offset += row_length;
  }
}
