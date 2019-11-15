#!/bin/bash

source ~/txgo/sourceme.sh

rm *.tsan.exe *.tx.exe
rm *.ll 
rm *.bc
rm fmm.prof.out
#rm *.out

make clean

PARSECDIR=../../../../../ \
CC=wllvm \
M4=m4 \
CFLAGS="-O0 -g" \
LDFLAGS="-O0 -g -lpthread" \
make version=pthreads -j4

/home/lzto/txgo/whole-program-llvm/extract-bc fmm

/opt/spec/tools-root/bin/llvm-dis -o fmm.ll fmm.bc


#build prof bin

./txbin-prof.sh fmm.bc

#do profiling
./txbin-pin.sh fmm

#build tx

./txbin-tx.sh fmm.bc

#build tsan

./txbin-tsan.sh fmm.bc

#run!

#time ./fmm.tsan.exe 4 in_64K.txt prices.txt

