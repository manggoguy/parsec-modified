#!/bin/bash

make clean

CXX=clang++ \
CXXFLAGS="-Wno-deprecated -Ofast -g" \
make

mv freqmine freqmine.orig.exe

