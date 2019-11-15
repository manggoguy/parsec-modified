#!/bin/bash


/usr/bin/m4 ./c.m4.pthreads blackscholes.c > blackscholes.m4.cpp

#CROSS_COMPILE=/home/lzto/txgoto/llvm/build/bin/

${CROSS_COMPILE}clang++ -O3 -g \
	-fsanitize=thread \
	-funroll-loops \
	-fprefetch-loop-arrays \
	-fpermissive \
	-fno-exceptions \
	-static-libgcc \
	-Wl,--hash-style=both,--as-needed \
	-DPARSEC_VERSION=3.0-beta-20130728 \
	-pthread \
	-DENABLE_THREADS -DNCO=4   \
	blackscholes.m4.cpp \
	-L/usr/lib64 -L/usr/lib  \
	-o blackscholes.gtsan.exe \
	-lpthread -fPIE -pie


