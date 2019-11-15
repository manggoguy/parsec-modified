#!/bin/bash

source ~/txgo/sourceme.sh

rm *.exe
rm *.ll 
rm *.bc

make clean

CC=wllvm \
CFLAGS="-Ofast -g" \
LDFLAGS="-Ofast -g -lpthread" \
make

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

