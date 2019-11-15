#!/bin/bash
#test script

rm -rf corel queries

#tar xfv ../inputs/input_native.tar
#ARGS="corel lsh queries 50 20 4 output.txt"

nt=4

tar xfv ../inputs/input_simlarge.tar
ARGS="corel lsh queries 10 20 ${nt} output.txt"

execmd="./ferret.${1}.exe ${ARGS}"

#execmd="./ferret.tsan.exe corel lsh queries 10 20 4 output.txt"
#execmd="./ferret.tx.exe corel lsh queries 10 20 4 output.txt"
#execmd="./ferret.tx-cl.exe corel lsh queries 10 20 4 output.txt"

for ((iter=0;iter<1;iter++)) ; do
	echo "----------WARN:$iter-----------"
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

