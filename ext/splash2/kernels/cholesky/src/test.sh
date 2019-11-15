#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./blackscholes.${atype}.exe 4 in_64K.txt prices.txt"

#execmd="./blackscholes.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./blackscholes.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./blackscholes.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

