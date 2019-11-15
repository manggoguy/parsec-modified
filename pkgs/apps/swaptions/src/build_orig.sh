#!/bin/bash

make clean 

env version=pthreads \
CXX=clang++ \
CXXFLAGS="-g -Ofast -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -pthread  -DENABLE_THREADS" \
LDFLAGS="-g -Ofast" \
/usr/bin/make

mv swaptions swaptions.orig.exe

