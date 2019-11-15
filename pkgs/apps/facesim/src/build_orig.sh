#!/bin/bash

rm `find . |grep \.o$`
rm `find . |grep \.d$`

CC=${CROSS_COMPILE}clang \
CXX=${CROSS_COMPILE}clang++ \
PHYSBAM=`pwd` \
version=pthreads \
CXXFLAGS="-DENABLE_PTHREADS -O3 -g" \
CFLAGS=$CXXFLAGS \
LDFLAGS="" \
make -j10

cp ./Benchmarks/facesim/facesim ./facesim.orig.exe

#rm -rf ./Face_Data ./Storytelling
#tar xf ../inputs/input_simlarge.tar
#time ./facesim.orig -timing -threads 4

