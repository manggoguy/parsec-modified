#!/bin/bash

rm *.ll 
rm *.bc

make clean

export CC=wllvm
export CXX=wllvm++
export RANLIB=ranlib
./configure \
	--enable-pthread \
	--extra-cflags="-Ofast -g" \
	--extra-ldflags="-Ofast -g" \
	--enable-debug

make -j10


/home/lzto/txgo/whole-program-llvm/extract-bc x264

/opt/spec/tools-root/bin/llvm-dis -o x264.ll x264.bc

tar xf ../inputs/input_simlarge.tar

#build prof bin

./txbin-prof.sh x264.bc

#do profiling
tar xf ../inputs/input_simsmall.tar
./txbin-pin.sh x264

#build tx

./txbin-tx.sh x264.bc

#build tsan

./txbin-tsan.sh x264.bc

#run!

#time ./x264.tsan.exe --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 4 -o eledream.264 eledream_640x360_128.y4m

