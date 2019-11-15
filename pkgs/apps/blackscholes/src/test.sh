#!/bin/bash
#test script

nt="4"

atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


ARGS="in_64K.txt prices.txt"
#ARGS="in_10M.txt prices.txt"

execmd="./blackscholes.${atype}.exe ${nt} ${ARGS}"

#execmd="./blackscholes.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./blackscholes.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./blackscholes.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<1;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

