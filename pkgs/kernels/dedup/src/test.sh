#!/bin/bash
#test script

rm  -f media.dat

#tar vxf ../inputs/input_simsmall.tar
#tar vxf ../inputs/input_simmedium.tar
tar vxf ../inputs/input_simlarge.tar

#rm -f output.dat.ddp

nt=4

execmd="./dedup.${1}.exe  -c -p -v -t ${nt} -i media.dat -o output.dat.ddp"

#execmd="./dedup.tsan.exe  -c -p -v -t 2 -i media.dat -o output.dat.ddp"
#execmd="./dedup.tx.exe  -c -p -v -t 2 -i media.dat -o output.dat.ddp"
#execmd="./dedup.tx-cl.exe  -c -p -v -t 2 -i media.dat -o output.dat.ddp"
#execmd="./dedup -c -p -v -t 2 -i media.dat -o output.dat.ddp"
#execmd="./dedup.gtsan -c -p -v -t 2 -i media.dat -o output.dat.ddp"



for ((iter=0;iter<1;iter++)) ; do
	time $execmd 2>&1
	sleep 1
done

