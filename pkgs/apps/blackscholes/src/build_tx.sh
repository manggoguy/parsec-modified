#!/bin/bash

rm *.exe
rm *.ll 
rm *.bc

/usr/bin/m4 ./c.m4.pthreads blackscholes.c > blackscholes.m4.cpp

#wllvm++ -O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -static-libgcc -Wl,--hash-style=both,--as-needed -DPARSEC_VERSION=3.0-beta-20130728 -pthread -DENABLE_THREADS -DNCO=4   blackscholes.m4.cpp -L/usr/lib64 -L/usr/lib  -o blackscholes -lpthread -fPIE -pie

wllvm++ -O3 -g -funroll-loops -fprefetch-loop-arrays -fpermissive -fno-exceptions -DPARSEC_VERSION=3.0-beta-20130728 -pthread -DENABLE_THREADS -DNCO=4   blackscholes.m4.cpp -o blackscholes -lpthread -fPIE -pie

/home/lzto/txgo/whole-program-llvm/extract-bc blackscholes

/opt/spec/tools-root/bin/llvm-dis -o blackscholes.ll blackscholes.bc


#build prof bin

./txbin-prof.sh blackscholes.bc

#do profiling

./txbin-pin.sh blackscholes

#build tx

./txbin-tx.sh blackscholes.bc

#build tsan

./txbin-tsan.sh blackscholes.bc

#run!

#time ./blackscholes.tsan.exe 4 in_64K.txt prices.txt

