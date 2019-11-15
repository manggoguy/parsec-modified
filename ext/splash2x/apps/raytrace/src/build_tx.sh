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

/home/lzto/txgo/whole-program-llvm/extract-bc raytrace

/opt/spec/tools-root/bin/llvm-dis -o raytrace.ll raytrace.bc


#build prof bin

./txbin-prof.sh raytrace.bc

#do profiling
./txbin-pin.sh raytrace

#build tx

./txbin-tx.sh raytrace.bc

#build tsan

./txbin-tsan.sh raytrace.bc

#run!

#time ./raytrace.tsan.exe 4 in_64K.txt prices.txt

