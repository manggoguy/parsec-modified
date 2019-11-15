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

/home/lzto/txgo/whole-program-llvm/extract-bc water_nsquared

/opt/spec/tools-root/bin/llvm-dis -o water_nsquared.ll water_nsquared.bc


#build prof bin

./txbin-prof.sh water_nsquared.bc

#do profiling
./txbin-pin.sh water_nsquared

#build tx

./txbin-tx.sh water_nsquared.bc

#build tsan

./txbin-tsan.sh water_nsquared.bc

#run!

#time ./water_nsquared.tsan.exe 4 in_64K.txt prices.txt

