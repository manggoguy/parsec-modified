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

/home/lzto/txgo/whole-program-llvm/extract-bc barnes

/opt/spec/tools-root/bin/llvm-dis -o barnes.ll barnes.bc


#build prof bin

./txbin-prof.sh barnes.bc

#do profiling
./txbin-pin.sh barnes

#build tx

./txbin-tx.sh barnes.bc

#build tsan

./txbin-tsan.sh barnes.bc

#run!

#time ./barnes.tsan.exe 4 in_64K.txt prices.txt

