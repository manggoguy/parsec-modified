#!/bin/bash

make clean 

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

version=pthreads \
CFLAGS=" -Ofast -g -fsanitize=thread" \
CXXFLAGS=" ${CFLAGS}" \
LDFLAGS=" ${CFLAGS} " \
CXX="${CROSS_COMPILE}clang++" \
CC="${CROSS_COMPILE}clang" \
/usr/bin/make

mv streamcluster streamcluster.gtsan.exe

