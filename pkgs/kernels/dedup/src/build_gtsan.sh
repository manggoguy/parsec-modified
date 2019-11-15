#!/bin/bash

make clean 

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

version=pthreads \
CC=${CROSS_COMPILE}clang \
CFLAGS=" -fsanitize=thread  -Ofast -g" \
CLANG=${CROSS_COMPILE}clang \
/usr/bin/make 

mv dedup dedup.gtsan.exe

