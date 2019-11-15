#!/bin/bash

make clean

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

export CC=${CROSS_COMPILE}clang
export CXX=${CROSS_COMPILE}clang++
export RANLIB=ranlib
./configure \
	--enable-pthread \
	--extra-cflags="-Ofast -g -fsanitize=thread" \
	--extra-ldflags="-Ofast -g -fsanitize=thread" \
	--enable-debug \
	--enable-pic

#	--disable-asm

make -j10

mv x264 x264.gtsan.exe

