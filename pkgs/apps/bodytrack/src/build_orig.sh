#!/bin/bash


make clean

CC=clang \
CXX=clang++ \
VPATH=`pwd` \
CFLAGS="-Ofast -I. -I./FlexImageLib -g -funroll-loops -fprefetch-loop-arrays -fpermissive" \
CXXFLAGS="${CFLAGS}" \
LDFLAFS="-Ofast -g" \
./configure --enable-threads --disable-openmp --disable-tbb

make -j

cp ./TrackingBenchmark/bodytrack ./bodytrack.orig.exe

