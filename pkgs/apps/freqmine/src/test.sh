#!/bin/bash
#test script

export OMP_NUM_THREADS=4

#tar vxf ../inputs/input_native.tar
#ARGS="webdocs_250k.dat 11000"

tar vxf ../inputs/input_simlarge.tar
ARGS="kosarak_990k.dat 790"

execmd="./freqmine.${1}.exe ${ARGS}"

#execmd="./freqmine.tsan.exe kosarak_990k.dat 790"
#execmd="./freqmine.tx.exe kosarak_990k.dat 790"
#execmd="./freqmine.tx-cl.exe kosarak_990k.dat 790"

for ((iter=0;iter<1;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

