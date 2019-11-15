#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi


execmd="./radiosity.${atype}.exe -bf 1.5e-3 -batch -room -p 4"

#execmd="./radiosity.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./radiosity.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./radiosity.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time $execmd
	sleep 1
done

