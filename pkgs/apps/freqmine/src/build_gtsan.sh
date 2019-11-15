#!/bin/bash

make clean

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

CXX=${CROSS_COMPILE}clang++ \
CXXFLAGS="-Wno-deprecated -Ofast -g -fsanitize=thread -fPIE -pie" \
make

mv freqmine freqmine.gtsan.exe

