#!/bin/bash

source ~/txgo/sourceme.sh

rm *.exe
rm *.ll 
rm *.bc
rm *.out

make clean 

env version=pthreads /usr/bin/make 

/home/lzto/txgo/whole-program-llvm/extract-bc dedup

##mv dedup.bc dedup_stage1.bc

#opt -std-compile-opts -std-link-opts -O3 dedup_stage1.bc -o dedup.bc

tar xf ../inputs/input_simlarge.tar

#mv dedupx.bc dedup.bc

/opt/spec/tools-root/bin/llvm-dis -o dedup.ll dedup.bc

#build prof bin

./txbin-prof.sh dedup.bc

#do profiling

./txbin-pin.sh dedup

#build tx

./txbin-tx.sh dedup.bc

#build tsan

./txbin-tsan.sh dedup.bc

#run!

time ./dedup.tsan.exe  -c -p -v -t 4 -i media.dat -o output.dat.ddp

