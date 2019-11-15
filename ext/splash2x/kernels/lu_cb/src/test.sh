#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./lu_cb.${atype}.exe -p4 -n2048 -b16 "

#execmd="./lu_cb.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./lu_cb.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./lu_cb.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

