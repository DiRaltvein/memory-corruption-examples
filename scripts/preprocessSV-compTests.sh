#!/bin/bash

for file in /mnt/a/master/master/sv-comp_tests/*; do
  if [[ $file != *.c && $file != *.cc ]]; then
    continue;
  fi

  if [[ $file == *.cc ]]; then
    preprocessedFile="${file/.cc/.i}"
    # echo "$file -> $preprocessedFile"
    /usr/llvm-project/build/bin/clang++ -E -P "$file" -o "$preprocessedFile" -m32
  else
    preprocessedFile="${file/.c/.i}"
    # echo "$file -> $preprocessedFile"
    /usr/llvm-project/build/bin/clang -E -P "$file" -o "$preprocessedFile" -m32
  fi
done
