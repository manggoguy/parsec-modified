#!/bin/bash

make clean

export CC=clang
export CXX=clang++
export RANLIB=ranlib
./configure \
	--enable-pthread \
	--extra-cflags="-Ofast -g" \
	--extra-ldflags="-Ofast -g" \
	--enable-debug

make -j10

mv x264 x264.orig.exe

