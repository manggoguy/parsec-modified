#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./radix.${atype}.exe -p4 -r4096 -n67108864 -m2147483647 "

#execmd="./radix.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./radix.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./radix.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

