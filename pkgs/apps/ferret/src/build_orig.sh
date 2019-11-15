#!/bin/bash

make clean

export CC=clang
export CXX=clang++
export CFLAGS="-Ofast -g"
export CXXFLAGS="-Ofast -g"
export LDFLAGS="-Ofast -g"
env version="pthreads" make -j

cp parsec/bin/ferret-pthreads ./ferret.orig.exe

