#!/bin/bash

make clean

M4=m4 \
CC=~/txgoto/llvm/build/bin/clang \
CFLAGS="-fsanitize=thread -fPIC -g -Ofast" \
LDFLAGS="-fsanitize=thread -fPIC -g -Ofast" \
make version=pthreads -j4

mv volrend volrend.gtsan.exe

