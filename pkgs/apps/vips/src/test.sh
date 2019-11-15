#!/bin/bash
#test script

export IM_CONCURRENCY=4

execmd="./vips.${1}.exe im_benchmark bigben_2662x5500.v output.v"

#execmd="./vips.tsan.exe im_benchmark bigben_2662x5500.v output.v"
#execmd="./vips.tx.exe im_benchmark bigben_2662x5500.v output.v"
#execmd="./vips.tx-cl.exe im_benchmark bigben_2662x5500.v output.v"
#execmd="./vips.gtsan im_benchmark bigben_2662x5500.v output.v"
#execmd="./vips im_benchmark bigben_2662x5500.v output.v"

#for ((iter=0;iter<5;iter++)) ; do
for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

