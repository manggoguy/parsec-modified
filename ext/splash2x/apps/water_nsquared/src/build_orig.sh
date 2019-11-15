#!/bin/bash

make clean

M4=m4 \
CC=~/txgoto/llvm/build/bin/clang \
CFLAGS="-g -Ofast" \
LDFLAGS="-g -Ofast -lpthread" \
make version=pthreads -j4

mv water_nsquared water_nsquared.orig.exe

