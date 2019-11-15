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

/home/lzto/txgo/whole-program-llvm/extract-bc ocean_cp

/opt/spec/tools-root/bin/llvm-dis -o ocean_cp.ll ocean_cp.bc


#build prof bin

./txbin-prof.sh ocean_cp.bc

#do profiling
./txbin-pin.sh ocean_cp

#build tx

./txbin-tx.sh ocean_cp.bc

#build tsan

./txbin-tsan.sh ocean_cp.bc

#run!

#time ./ocean_cp.tsan.exe 4 in_64K.txt prices.txt

