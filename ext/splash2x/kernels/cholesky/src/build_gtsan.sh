#!/bin/bash

make clean

M4=m4 \
CC=~/txgoto/llvm/build/bin/clang \
CFLAGS="-fsanitize=thread -fPIE -pie -g -Ofast" \
LDFLAGS="-fsanitize=thread -fPIE -pie -g -Ofast" \
make version=pthreads -j4

mv cholesky cholesky.gtsan.exe

