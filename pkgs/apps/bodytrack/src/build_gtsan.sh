#!/bin/bash


make clean

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

CC=${CROSS_COMPILE}clang \
CXX=${CROSS_COMPILE}clang++ \
VPATH=`pwd` \
CFLAGS="-fsanitize=thread -Ofast -I. -I./FlexImageLib -g -funroll-loops -fprefetch-loop-arrays -fpermissive" \
CXXFLAGS="${CFLAGS}" \
LDFLAFS="-fsanitize=thread -Ofast -g" \
./configure --enable-threads --disable-openmp --disable-tbb

make -j

cp ./TrackingBenchmark/bodytrack ./bodytrack.gtsan.exe

