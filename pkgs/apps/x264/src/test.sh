#!/bin/bash
#test script


#tar xfv ../inputs/input_native.tar
#ARGS="--quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 4 -o eledream.264 eledream_1920x1080_512.y4m"

nt=4

tar xfv ../inputs/input_simlarge.tar
ARGS="--quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads ${nt} -o eledream.264 eledream_640x360_128.y4m"

execmd="./x264.${1}.exe ${ARGS}"

for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

