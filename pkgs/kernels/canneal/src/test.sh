#!/bin/bash
#test script

nt=4

execmd="./canneal.${1}.exe ${nt} 15000 2000 400000.nets 128"

#execmd="./canneal.tsan.exe  4 15000 2000 400000.nets 128"
#execmd="./canneal.tx.exe  4 15000 2000 400000.nets 128"
#execmd="./canneal.tx-cl.exe  4 15000 2000 400000.nets 128"

for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

