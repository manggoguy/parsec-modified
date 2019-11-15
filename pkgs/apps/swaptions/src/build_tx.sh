#!/bin/bash

rm *.ll 
rm *.bc

make clean 

env version=pthreads \
CXX=wllvm++ \
CXXFLAGS="-g -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -pthread  -DENABLE_THREADS" \
LDFLAGS="-g -Ofast" \
/usr/bin/make

/home/lzto/txgo/whole-program-llvm/extract-bc swaptions

/opt/spec/tools-root/bin/llvm-dis -o swaptions.ll swaptions.bc

#build prof bin

./txbin-prof.sh swaptions.bc

#do profiling

./txbin-pin.sh swaptions

#build tx

./txbin-tx.sh swaptions.bc

#build tsan

./txbin-tsan.sh swaptions.bc

#run!

#time ./swaptions.tsan.exe -ns 64 -sm 40000 -nt 4

