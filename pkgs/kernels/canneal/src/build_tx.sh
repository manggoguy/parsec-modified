#!/bin/bash

rm *.exe
rm *.ll 
rm *.bc
rm *.out 

env version=pthreads /usr/bin/make 

/home/lzto/txgo/whole-program-llvm/extract-bc canneal

#mv canneal.bc canneal_stage1.bc

#opt -std-compile-opts -std-link-opts -O3 canneal_stage1.bc -o canneal.bc

/opt/spec/tools-root/bin/llvm-dis -o canneal.ll canneal.bc

tar xf ../inputs/input_simlarge.tar

#build prof bin

./txbin-prof.sh canneal.bc

#do profiling

./txbin-pin.sh canneal

#build tx

./txbin-tx.sh canneal.bc

#build tsan

./txbin-tsan.sh canneal.bc

#run!

time ./canneal.tsan.exe  4 15000 2000 400000.nets 128

