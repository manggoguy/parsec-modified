#!/bin/bash

rm *.exe
rm *.ll 
rm *.bc
rm *.out

make clean

export CC=wllvm
export CXX=wllvm++
env version="pthreads" make -j

cp parsec/bin/ferret-pthreads ./ferret

/home/lzto/txgo/whole-program-llvm/extract-bc ferret

mv ferret.bc ferret_stage1.bc
opt -std-compile-opts -std-link-opts -O3 ferret_stage1.bc -o ferret.bc

/opt/spec/tools-root/bin/llvm-dis -o ferret.ll ferret.bc

#build prof bin
./txbin-prof.sh ferret.bc

#do profiling
#rm -rf ./queries ./corel
#tar xf ../inputs/input_simsmall.tar
rm -rf ./queries ./corel
tar xf ../inputs/input_simlarge.tar
./txbin-pin.sh ferret

#build tx

./txbin-tx.sh ferret.bc

#build tsan

./txbin-tsan.sh ferret.bc

#run!
#rm -rf ./queries ./corel
#tar xf ../inputs/input_simlarge.tar

#time ./ferret.tsan.exe corel lsh queries 10 20 4 output.txt

