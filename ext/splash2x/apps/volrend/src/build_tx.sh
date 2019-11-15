#!/bin/bash

source ~/txgo/sourceme.sh

rm *.tsan.exe *.tx.exe
rm *.ll 
rm *.bc
#rm *.out

make clean

PARSECDIR=../../../../../ \
CC=wllvm \
M4=m4 \
CFLAGS="-Ofast -g" \
LDFLAGS="-Ofast -g -lpthread" \
make version=pthreads -j4

/home/lzto/txgo/whole-program-llvm/extract-bc volrend

/opt/spec/tools-root/bin/llvm-dis -o volrend.ll volrend.bc


#build prof bin

./txbin-prof.sh volrend.bc

#do profiling
./txbin-pin.sh volrend

#build tx

./txbin-tx.sh volrend.bc

#build tsan

./txbin-tsan.sh volrend.bc

#run!

#time ./volrend.tsan.exe 4 in_64K.txt prices.txt

