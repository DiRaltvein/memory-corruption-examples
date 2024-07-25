// https://www.cvedetails.com/cve/CVE-2023-27103/
// repository: https://github.com/strukturag/libde265
// commit: 97b334a
// extract of: libde265/motion.cc (function: derive_collocated_motion_vectors)

#include <vector>

struct de265_image {
  std::vector<int> slices;
  int get_SliceHeaderIndex(int x, int y) { return x + y; }
};

int main(int argc, char *argv[]) {
  de265_image colImg;
  colImg.slices[colImg.get_SliceHeaderIndex(5, 5)]; // Problem slices vector has length of 0 and the access of element on index 10 is out of bound
}
