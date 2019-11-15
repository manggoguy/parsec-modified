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

/home/lzto/txgo/whole-program-llvm/extract-bc radiosity

/opt/spec/tools-root/bin/llvm-dis -o radiosity.ll radiosity.bc


#build prof bin

./txbin-prof.sh radiosity.bc

#do profiling
./txbin-pin.sh radiosity

#build tx

./txbin-tx.sh radiosity.bc

#build tsan

./txbin-tsan.sh radiosity.bc

#run!

#time ./radiosity.tsan.exe 4 in_64K.txt prices.txt

