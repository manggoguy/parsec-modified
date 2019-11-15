#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./cholesky.${atype}.exe -p4 ../inputs/input_simlarge.tar"

#execmd="./cholesky.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./cholesky.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./cholesky.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

