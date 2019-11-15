#!/bin/bash

env version=pthreads \
CXX=clang++ \
CXXFLAGS="-DNDEBUG -D_MM_NO_ALIGN_CHECK -g -Ofast" \
LIBS="-lGL -lGLU -lXmu -lXext -lXau -lX11 -ldl -lpthread -g -Ofast" \
./configure

make -j10

cp bin/rtview ./rtview.orig.exe

