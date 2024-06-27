// https://www.cvedetails.com/cve/CVE-2022-29021/
// repository: https://github.com/openrazer/openrazer
// commit: 9991fc6
// extract of: driver/razerchromacommon.c (function: razer_chroma_standard_matrix_set_custom_frame)

// similar CVE's are:
// - https://www.cvedetails.com/cve/CVE-2022-29022/
// - https://www.cvedetails.com/cve/CVE-2022-29023/

#include <string.h>
#include <stdlib.h>

void razer_chroma_standard_matrix_set_custom_frame(unsigned char start_col, unsigned char stop_col)
{
    size_t row_length = (size_t)(((stop_col + 1) - start_col) * 3);
    unsigned char report_argument[10];

    memcpy(report_argument, "012345678", row_length); // Problem: row_length is greater than 10 bytes
}

int main(int argc, char *argv[])
{
    razer_chroma_standard_matrix_set_custom_frame(97, 102);
}
