#!/bin/bash

rm *.exe
rm *.ll 
rm *.bc

rm `find . |grep \.o$`
rm `find . |grep \.d$`

CC=wllvm \
CXX=wllvm++ \
PHYSBAM=`pwd` \
version=pthreads \
CXXFLAGS="-DENABLE_PTHREADS -g -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive " \
CFLAGS="$CXXFLAGS" \
make -j10

cp ./Benchmarks/facesim/facesim ./facesim

/home/lzto/txgo/whole-program-llvm/extract-bc facesim

#mv facesim.bc facesim_stage1.bc

#/opt/spec/tools-root/bin/llvm-dis -o facesim_stage1.ll facesim_stage1.bc

#opt -std-compile-opts -std-link-opts -O3 facesim_stage1.bc -o facesim.bc

#:<<COMMENT
#build prof bin
./txbin-prof.sh facesim.bc

#do profiling

rm -rf ./Face_Data ./Storytelling
tar xf ../inputs/input_simsmall.tar

./txbin-pin.sh facesim

#COMMENT
#build tx

./txbin-tx.sh facesim.bc

#build tsan

./txbin-tsan.sh facesim.bc

#run!
#rm -rf ./Face_Data ./Storytelling
#tar xf ../inputs/input_simlarge.tar
#time ./facesim.tsan.exe -timing -threads 4

