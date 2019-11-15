#!/bin/bash

make clean

M4=m4 \
CC=~/txgoto/llvm/build/bin/clang \
CFLAGS="-g -Ofast" \
LDFLAGS="-g -Ofast -lpthread" \
make version=pthreads -j4

mv ocean_cp ocean_cp.orig.exe

