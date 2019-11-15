#!/bin/bash
#test script

tar xfv ../inputs/input_simlarge.tar
ARGS="5 in_300K.fluid out.fluid"

#ARGS="500 in_500K.fluid out.fluid"

nt=4

execmd="./fluidanimate.${1}.exe  ${nt} ${ARGS}"

#execmd="./fluidanimate.tsan.exe  4 5 in_300K.fluid out.fluid"
#execmd="./fluidanimate.tx.exe  4 5 in_300K.fluid out.fluid"
#execmd="./fluidanimate.tx-cl.exe  4 5 in_300K.fluid out.fluid"
#execmd="./fluidanimate 4 5 in_300K.fluid out.fluid"

for ((iter=0;iter<1;iter++)) ; do
	export TSAN_SEED=$RANDOM
	time $execmd 2>&1
	sleep 1
done

