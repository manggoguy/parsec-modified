#!/bin/bash

/usr/bin/m4 ./c.m4.pthreads blackscholes.c > blackscholes.m4.cpp

wllvm++ -O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -pthread -DENABLE_THREADS -DNCO=4   blackscholes.m4.cpp -o blackscholes.orig.exe -lpthread -fPIE -pie



