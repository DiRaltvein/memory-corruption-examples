// https://www.cvedetails.com/cve/CVE-2022-29021/
// repository: https://github.com/openrazer/openrazer
// commit: 9991fc6
// extract of: driver/razerchromacommon.c (function: razer_chroma_standard_matrix_set_custom_frame)

#include <string.h>

void razer_chroma_standard_matrix_set_custom_frame(unsigned char start_col, unsigned char stop_col, unsigned char rgb_data)
{
    size_t row_length = (size_t)(((stop_col + 1) - start_col) * 3);
    unsigned char report_argument[80];

    memcpy(report_argument, &rgb_data, row_length);
}

int main(int argc, char *argv[])
{
    razer_chroma_standard_matrix_set_custom_frame('A', 'z', 'b');
}
