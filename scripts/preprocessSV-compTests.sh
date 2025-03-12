#!/bin/bash

for file in /mnt/a/master/master/sv-comp_tests/*; do
  if [[ $file != *.c && $file != *.cc ]]; then
    continue;
  fi

  if [[ $file == *.cc ]]; then
    preprocessedFile="${file/.cc/.i}"
    # echo "$file -> $preprocessedFile"
    clang++ -E -P "$file" -o "$preprocessedFile" -m32
  else
    preprocessedFile="${file/.c/.i}"
    # echo "$file -> $preprocessedFile"
    clang -E -P "$file" -o "$preprocessedFile" -m32
    sed -i '/typedef float _Float32;/d' "$preprocessedFile"
    sed -i '/typedef double _Float64;/d' "$preprocessedFile"
    sed -i '/typedef double _Float32x;/d' "$preprocessedFile"
    sed -i '/typedef long double _Float64x;/d' "$preprocessedFile"
  fi
done
