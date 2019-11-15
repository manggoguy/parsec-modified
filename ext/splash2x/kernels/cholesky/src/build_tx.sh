#!/bin/bash

source ~/txgo/sourceme.sh

rm *.tsan.exe *.tx.exe
rm *.ll 
rm *.bc
rm *.out

make clean

PARSECDIR=../../../../../ \
CC=wllvm \
M4=m4 \
CFLAGS="-Ofast -g" \
LDFLAGS="-Ofast -g -lpthread" \
make version=pthreads -j4

/home/lzto/txgo/whole-program-llvm/extract-bc cholesky

/opt/spec/tools-root/bin/llvm-dis -o cholesky.ll cholesky.bc


#build prof bin

./txbin-prof.sh cholesky.bc

#do profiling
./txbin-pin.sh cholesky

#build tx

./txbin-tx.sh cholesky.bc

#build tsan

./txbin-tsan.sh cholesky.bc

#run!

#time ./cholesky.tsan.exe 4 in_64K.txt prices.txt

