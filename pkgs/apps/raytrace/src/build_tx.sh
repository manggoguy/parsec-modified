#!/bin/bash

#:<<COMMENT
rm *.exe
rm *.ll 
rm *.bc


#env version=pthreads CXXFLAGS=-O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -static-libgcc -Wl,--hash-style=both,--as-needed -fsanitize=thread -g -DPARSEC_VERSION=3.0-beta-20130728 -fexceptions -fno-strict-aliasing -fno-align-labels -DNDEBUG -D_MM_NO_ALIGN_CHECK LIBS= -lGL -lGLU -lXmu -lXext -lXau -lX11 -ldl -lpthread ./configure --prefix=/home/lzto/benchmark/parsec-3.0-tsan-copy/pkgs/apps/raytrace/inst/amd64-linux.gcc-pthreads

env version=pthreads \
CXX=wllvm++ \
CXXFLAGS="-DNDEBUG -D_MM_NO_ALIGN_CHECK -g" \
LIBS="-lGL -lGLU -lXmu -lXext -lXau -lX11 -ldl -lpthread " \
./configure

make -j10

cp bin/rtview ./rtview

/home/lzto/txgo/whole-program-llvm/extract-bc rtview

/opt/spec/tools-root/bin/llvm-dis -o raytrace.ll rtview.bc
#COMMENT

tar xf ../inputs/input_simlarge.tar

#build prof bin

./txbin-prof.sh rtview.bc

#do profiling

./txbin-pin.sh rtview

#build tx

./txbin-tx.sh rtview.bc

#build tsan

./txbin-tsan.sh rtview.bc

#run!

#time ./rtview.tsan.exe ppy_buddha.obj -automove -nthreads 4 -frames 3 -res 1920 1080
#time ./rtview.tsan.exe happy_buddha.obj -automove -nthreads 4 -frames 3 -res 1920 1080

