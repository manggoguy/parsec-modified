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
CFLAGS="-O0 -g" \
LDFLAGS="-O0 -g -lpthread" \
make version=pthreads -j4

/home/lzto/txgo/whole-program-llvm/extract-bc lu_cb

/opt/spec/tools-root/bin/llvm-dis -o lu_cb.ll lu_cb.bc


#build prof bin

./txbin-prof.sh lu_cb.bc

#do profiling
./txbin-pin.sh lu_cb

#build tx

./txbin-tx.sh lu_cb.bc

#build tsan

./txbin-tsan.sh lu_cb.bc

#run!

#time ./lu_cb.tsan.exe 4 in_64K.txt prices.txt

