#!/bin/bash

CXXFLAGS="-g -pthread -D_GNU_SOURCE -D__XOPEN_SOURCE=600 -Wno-invalid-offsetof -O3"

echo "BUILD pthreads.bc"
clang++ $CXXFLAGS -c pthreads.cpp

echo "BUILD cellpool.bc"
clang++ $CXXFLAGS -c cellpool.cpp

echo "BUILD parsec_barrier.bc"
clang++ $CXXFLAGS -c parsec_barrier.cpp

echo "Linking..."
clang++ $CXXFLAGS pthreads.o cellpool.o parsec_barrier.o -o fluidanimate.orig.exe -lpthread


