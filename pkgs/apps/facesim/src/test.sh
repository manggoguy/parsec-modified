#!/bin/bash
#test script

rm -rf Face_Data/

#tar xfv ../inputs/input_native.tar
#ARGS="-timing -threads 4 -lastframe 100"

nt=4

tar xfv ../inputs/input_simlarge.tar
ARGS="-timing -threads ${nt}"

execmd="./facesim.${1}.exe ${ARGS}"

#execmd="./facesim.tsan.exe -timing -threads 4"
#execmd="./facesim.tx.exe -timing -threads 4"
#execmd="./facesim.tx-cl.exe -timing -threads 4"

for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 4
done

