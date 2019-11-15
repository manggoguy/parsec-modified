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

/home/lzto/txgo/whole-program-llvm/extract-bc ocean_ncp

/opt/spec/tools-root/bin/llvm-dis -o ocean_ncp.ll ocean_ncp.bc


#build prof bin

./txbin-prof.sh ocean_ncp.bc

#do profiling
./txbin-pin.sh ocean_ncp

#build tx

./txbin-tx.sh ocean_ncp.bc

#build tsan

./txbin-tsan.sh ocean_ncp.bc

#run!

#time ./ocean_ncp.tsan.exe 4 in_64K.txt prices.txt

