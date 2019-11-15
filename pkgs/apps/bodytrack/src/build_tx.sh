#!/bin/bash


#:<<COMMENT
#rm *.exe
#rm *.ll 
#rm *.bc

make clean

CC=wllvm \
CXX=wllvm++ \
VPATH=`pwd` \
CFLAGS="-Ofast -I. -I./FlexImageLib -g -funroll-loops -fprefetch-loop-arrays -fpermissive" \
CXXFLAGS="${CFLAGS}" \
LDFLAFS="-Ofast -g" \
./configure --enable-threads --disable-openmp --disable-tbb

make -j

#COMMENT

cp ./TrackingBenchmark/bodytrack ./bodytrack

/home/lzto/txgo/whole-program-llvm/extract-bc bodytrack

#mv bodytrack.bc bodytrack_stage1.bc

#opt -std-compile-opts -std-link-opts -O3 bodytrack_stage1.bc -o bodytrack.bc

/opt/spec/tools-root/bin/llvm-dis -o bodytrack.ll bodytrack.bc


#build prof bin
./txbin-prof.sh bodytrack.bc

#do profiling

rm -rf ./sequenceB_1/
tar xfv ../inputs/input_test.tar
./txbin-pin.sh bodytrack

#build tx

./txbin-tx.sh bodytrack.bc

#build tsan

./txbin-tsan.sh bodytrack.bc

#run!

#rm -rf ./sequenceB_4/
#tar xfv ../inputs/input_simlarge.tar
#time ./bodytrack.tsan.exe sequenceB_4 4 4 4000 5 0 4

