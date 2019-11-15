#!/bin/bash

make clean 

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

env version=pthreads \
CXX=${CROSS_COMPILE}clang++ \
CXXFLAGS="-g -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -pthread  -DENABLE_THREADS -fsanitize=thread" \
LDFLAGS="-g -Ofast -fsanitize=thread" \
/usr/bin/make

mv swaptions swaptions.gtsan.exe

