#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./volrend.${atype}.exe 4 head-scaleddown2 100"

#execmd="./volrend.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./volrend.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./volrend.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd
	sleep 1
done

