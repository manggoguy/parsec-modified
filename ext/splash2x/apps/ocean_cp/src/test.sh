#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./ocean_cp.${atype}.exe -n2050 -p4 -e1e-07 -r20000 -t28800"

#execmd="./ocean_cp.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./ocean_cp.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./ocean_cp.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd
	sleep 1
done

