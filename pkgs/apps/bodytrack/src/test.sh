#!/bin/bash
#test script


rm -rf sequenceB_*

nt=2

tar xfv ../inputs/input_simlarge.tar
ARGS="sequenceB_4 4 4 4000 5 0 ${nt}"


#tar xfv ../inputs/input_native.tar
#ARGS="sequenceB_261 4 261 4000 5 0 4"

execmd="./bodytrack.${1}.exe ${ARGS}"


#execmd="./bodytrack.tsan.exe sequenceB_4 4 4 4000 5 0 4"
#execmd="./bodytrack.tx.exe sequenceB_4 4 4 4000 5 0 4"
#execmd="./bodytrack.tx-cl.exe sequenceB_4 4 4 4000 5 0 4"
#execmd="./bodytrack.gtsan sequenceB_4 4 4 4000 5 0 4"


for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd
	sleep 1
done

