clang-tidy -checks=* \<filename>\
clang/clang++ --analyze \<filename>\
cppcheck \<filename>\
scan-build \<filename>\
symbiotic/install/bin/symbiotic --prp=memsafety \<filename>


CFLAGS='-I/usr/include/clang/10/include' /home/raltvein/symbiotic/scripts/symbiotic --prp=memsafety <file>
CPPFLAGS='-I/usr/include/clang/10/include' /home/raltvein/symbiotic/scripts/symbiotic-cc --prp=memsafety <file>
