#!/bin/bash
#test script


atype=${1}

if [ "${1}" == "" ];then
	atype="tsan"
fi

tar xf ../inputs/input_simlarge.tar  
cat input.template | sed s/NUMPROCS/4/ > input_4


execmd="./fmm.${atype}.exe "

#execmd="./fmm.tsan.exe 4 in_64K.txt prices.txt"
#execmd="./fmm.tx-cl.exe 4 in_64K.txt prices.txt"
#execmd="./fmm.tx.exe 4 in_64K.txt prices.txt"

for ((iter=0;iter<5;iter++)) ; do
	time cat input_4 | $execmd
	sleep 1
done

