#!/bin/bash

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

CXXFLAGS="-g -pthread -D_GNU_SOURCE -D__XOPEN_SOURCE=600 -Wno-invalid-offsetof -Ofast -fsanitize=thread -fPIE -pie"

echo "BUILD pthreads.bc"
${CROSS_COMPILE}clang++ $CXXFLAGS -c pthreads.cpp

echo "BUILD cellpool.bc"
${CROSS_COMPILE}clang++ $CXXFLAGS -c cellpool.cpp

echo "BUILD parsec_barrier.bc"
${CROSS_COMPILE}clang++ $CXXFLAGS -c parsec_barrier.cpp

echo "Linking..."
${CROSS_COMPILE}clang++ $CXXFLAGS pthreads.o cellpool.o parsec_barrier.o -o fluidanimate.gtsan.exe -lpthread


