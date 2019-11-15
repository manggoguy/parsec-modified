#!/bin/bash
#test script

nt=4

execmd="./streamcluster.${1}.exe  10 20 128 16384 16384 1000 none output.txt ${nt}"

#execmd="./streamcluster.tsan.exe  10 20 128 16384 16384 1000 none output.txt 4"
#execmd="./streamcluster.tx.exe  10 20 128 16384 16384 1000 none output.txt 4"
#execmd="./streamcluster.tx-cl.exe  10 20 128 16384 16384 1000 none output.txt 4"

for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

