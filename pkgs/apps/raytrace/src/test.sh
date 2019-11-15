#!/bin/bash
#test script

#tar xf ../inputs/input_native.tar
#ARGS="thai_statue.obj -automove -nthreads 4 -frames 200 -res 1920 1080"

nt=4

tar xfv ../inputs/input_simlarge.tar
ARGS="happy_buddha.obj -automove -nthreads ${nt} -frames 3 -res 1920 1080"

execmd="./rtview.${1}.exe ${ARGS}"

#execmd="./rtview.tsan.exe happy_buddha.obj -automove -nthreads 4 -frames 3 -res 1920 1080"
#execmd="./rtview.tx.exe happy_buddha.obj -automove -nthreads 4 -frames 3 -res 1920 1080"
#execmd="./rtview.tx-cl.exe happy_buddha.obj -automove -nthreads 4 -frames 3 -res 1920 1080"

for ((iter=0;iter<5;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

