#!/bin/bash

#rm *.exe
rm *.ll 
rm *.bc
make clean 

CXX=wllvm++ \
CXXFLAGS="-Wno-deprecated -Ofast -g" \
make

/home/lzto/txgo/whole-program-llvm/extract-bc freqmine

/opt/spec/tools-root/bin/llvm-dis -o freqmine.ll freqmine.bc

tar xf ../inputs/input_simlarge.tar

#build prof bin

./txbin-prof.sh freqmine.bc

#do profiling

./txbin-pin.sh freqmine

#build tx

./txbin-tx.sh freqmine.bc

#build tsan

./txbin-tsan.sh freqmine.bc

#run!


#export OMP_NUM_THREADS=4
#time ./freqmine.tsan.exe kosarak_990k.dat 790

