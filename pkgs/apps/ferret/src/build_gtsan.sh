#!/bin/bash

make clean

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

export CC=${CROSS_COMPILE}clang
export CXX=${CROSS_COMPILE}clang++
export CFLAGS="-Ofast -g -fsanitize=thread -fPIC"
export CXXFLAGS="-Ofast -g -fsanitize=thread -fPIC"
export LDFLAGS="-Ofast -g -fsanitize=thread -fPIC"
env version="pthreads" make -j

cp parsec/bin/ferret-pthreads ./ferret.gtsan.exe

