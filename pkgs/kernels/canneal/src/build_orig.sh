#!/bin/bash

#CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

version=pthreads \
CXX=${CROSS_COMPILE}clang++ \
CXXFLAGS=" -Ofast" \
/usr/bin/make 

mv ./canneal ./canneal.orig.exe


