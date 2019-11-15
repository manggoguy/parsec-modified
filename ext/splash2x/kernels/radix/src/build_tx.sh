#!/bin/bash

source ~/txgo/sourceme.sh

rm *.tsan.exe *.tx.exe
rm *.ll 
rm *.bc

make clean

PARSECDIR=../../../../../ \
CC=wllvm \
M4=m4 \
CFLAGS="-Ofast -g" \
LDFLAGS="-Ofast -g -lpthread" \
make version=pthreads -j4

/home/lzto/txgo/whole-program-llvm/extract-bc radix

/opt/spec/tools-root/bin/llvm-dis -o radix.ll radix.bc


#build prof bin

./txbin-prof.sh radix.bc

#do profiling
./txbin-pin.sh radix

#build tx

./txbin-tx.sh radix.bc

#build tsan

./txbin-tsan.sh radix.bc

#run!

#time ./radix.tsan.exe 4 in_64K.txt prices.txt

