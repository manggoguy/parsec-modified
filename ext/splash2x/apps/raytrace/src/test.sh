#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi

tar xf ../inputs/input_simlarge.tar  

execmd="./raytrace.${atype}.exe -s -p4 -a8 balls4.env "

#execmd="./raytrace.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./raytrace.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./raytrace.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time  $execmd
	sleep 1
done

