#!/bin/bash
#test script


if [ "${1}" != "" ]; then
	atype=${1}
else
	atype="tsan"
fi
nt=4
ARGS="-ns 64 -sm 40000 -nt ${nt}"
#ARGS="-ns 128 -sm 1000000 -nt 4"

execmd="./swaptions.${atype}.exe ${ARGS}"


#execmd="./swaptions.tsan.exe -ns 64 -sm 40000 -nt 4"
#execmd="./swaptions.tx.exe -ns 64 -sm 40000 -nt 4"
#execmd="./swaptions.tx-cl.exe -ns 64 -sm 40000 -nt 4"

for ((iter=0;iter<1;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

