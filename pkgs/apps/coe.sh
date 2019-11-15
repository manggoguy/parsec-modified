#!/bin/bash

function txtsan
{

./txbin-tx.sh ${1}
./txbin-tsan.sh ${1}

./test.sh tx 2>&1 |tee tx-${2}.log
./test.sh tsan 2>&1 |tee tsan-${2}.log

echo "-----tx-----"
echo "sec"
cat tx-${2}.log |grep real |cut -d'm' -f2 |cut -d's' -f1
echo "min"
cat tx-${2}.log |grep real |sed -e "s/\t/ /g"|cut -d' ' -f2|cut -d'm' -f1

echo "----tsan----"
echo "sec"
cat tsan-${2}.log |grep real |cut -d'm' -f2 |cut -d's' -f1
echo "min"
cat tsan-${2}.log |grep real |sed -e "s/\t/ /g"|cut -d' ' -f2|cut -d'm' -f1
}

function gtsan
{
	./build_gtsan.sh
	./test.sh gtsan 2>&1 |tee gtsan-${2}.log
	echo "----gtsan----"
	echo "sec"
	cat gtsan-${2}.log |grep real |cut -d'm' -f2 |cut -d's' -f1
	echo "min"
	cat gtsan-${2}.log |grep real |sed -e "s/\t/ /g"|cut -d' ' -f2|cut -d'm' -f1
}

gtsan ${1} ${2}
