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

/home/lzto/txgo/whole-program-llvm/extract-bc lu_ncb

/opt/spec/tools-root/bin/llvm-dis -o lu_ncb.ll lu_ncb.bc


#build prof bin

./txbin-prof.sh lu_ncb.bc

#do profiling
./txbin-pin.sh lu_ncb

#build tx

./txbin-tx.sh lu_ncb.bc

#build tsan

./txbin-tsan.sh lu_ncb.bc

#run!

#time ./lu_ncb.tsan.exe 4 in_64K.txt prices.txt

