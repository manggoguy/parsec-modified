#!/bin/bash

rm *.exe
rm *.ll 
rm *.bc
rm *.o

#CXXFLAGS=-g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -Wno-invalid-offsetof -pthread -D_GNU_SOURCE -D__XOPEN_SOURCE=600 -fPIE -O3
#CXXFLAGS="-g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -Wno-invalid-offsetof -pthread -D_GNU_SOURCE -D__XOPEN_SOURCE=600 -fPIC -Ofast"

CXXFLAGS="-g -pthread -D_GNU_SOURCE -D__XOPEN_SOURCE=600 -Wno-invalid-offsetof -O3"

echo "BUILD pthreads.bc"
#clang++ $CXXFLAGS -c pthreads.cpp -emit-llvm
wllvm++ $CXXFLAGS -c pthreads.cpp

echo "BUILD cellpool.bc"
#clang++ $CXXFLAGS -c cellpool.cpp -emit-llvm
wllvm++  $CXXFLAGS -c cellpool.cpp

echo "BUILD parsec_barrier.bc"
#clang++ $CXXFLAGS -c parsec_barrier.cpp -emit-llvm
wllvm++ $CXXFLAGS -c parsec_barrier.cpp

echo "Linking..."
#llvm-link pthreads.bc cellpool.bc parsec_barrier.bc -o fluidanimate_stage1.bc
#llvm-link pthreads.bc cellpool.bc parsec_barrier.bc -o fluidanimate.bc
#opt -std-compile-opts -std-link-opts -O3 fluidanimate_stage1.bc -o fluidanimate.bc

wllvm++ $CXXFLAGS pthreads.o cellpool.o parsec_barrier.o -o fluidanimate -lpthread

/home/lzto/txgo/whole-program-llvm/extract-bc fluidanimate

/opt/spec/tools-root/bin/llvm-dis -o fluidanimate.ll fluidanimate.bc


#build prof bin

./txbin-prof.sh fluidanimate.bc

#do profiling

./txbin-pin.sh fluidanimate

#build tx

./txbin-tx.sh fluidanimate.bc

#build tsan

./txbin-tsan.sh fluidanimate.bc

#run!

time ./fluidanimate.tsan.exe  4 5 in_300K.fluid out.fluid


