#!/bin/bash

make clean 

CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

env version=pthreads \
CXX=${CROSS_COMPILE}clang++ \
CXXFLAGS="-DNDEBUG -D_MM_NO_ALIGN_CHECK -g -O1 -fPIC" \
LIBS="-lGL -lGLU -lXmu -lXext -lXau -lX11 -ldl -lpthread -fsanitize=thread -O1 -fPIC" \
./configure

make -j10

cp bin/rtview ./rtview.gtsan.exe

