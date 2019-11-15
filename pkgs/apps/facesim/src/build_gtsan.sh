#!/bin/bash

rm `find . |grep \.o$`
rm `find . |grep \.d$`

CROSS_COMPILE="/home/lzto/txgoto/llvm/build/bin/"

CC=${CROSS_COMPILE}clang \
CXX=${CROSS_COMPILE}clang++ \
PHYSBAM=`pwd` \
version=pthreads \
CXXFLAGS="-DENABLE_PTHREADS -fsanitize=thread -g -Ofast" \
CFLAGS="$CXXFLAGS" \
LDFLAGS="-fsanitize=thread -g -Ofast" \
make -j10

cp ./Benchmarks/facesim/facesim ./facesim.gtsan.exe

#rm -rf ./Face_Data ./Storytelling
#tar xf ../inputs/input_simlarge.tar
#time ./facesim.gtsan -timing -threads 4

