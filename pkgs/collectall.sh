#!/bin/bash

:<<COMMENT
benchdirs=(
apps/blackscholes
apps/bodytrack
apps/facesim
apps/ferret
apps/fluidanimate
apps/freqmine
apps/raytrace
apps/swaptions
apps/x264
kernels/canneal
kernels/dedup
kernels/streamcluster
)
COMMENT

benchdirs=(
apps/blackscholes
apps/fluidanimate
apps/swaptions
apps/freqmine
apps/raytrace
apps/ferret
apps/x264
apps/bodytrack
apps/facesim
kernels/streamcluster
kernels/dedup
kernels/canneal
)


type=${1}


for bdir in ${benchdirs[*]}; do
	echo "---${bdir}---"
	pushd ${bdir}/src  2>&1 >> /dev/null
		#echo "----gtsan----"
		#echo "sec"
		secss=`cat gtsan-${type}.log |grep real |cut -d'm' -f2 |cut -d's' -f1`
		#echo "min"
		minss=`cat gtsan-${type}.log |grep real |sed -e "s/\t/ /g"|cut -d' ' -f2|cut -d'm' -f1`

		sum_cmd="0";
		for min in ${minss[*]}; do
			sum_cmd=${sum_cmd}"+"${min}
		done
		for sec in ${secss[*]}; do
			sum_cmd=${sum_cmd}"+"${sec}
		done
		sum_cmd="scale=4;($sum_cmd)/5"
		avg=`echo $sum_cmd | bc`
		echo $avg
	popd 2>&1 >>/dev/null
done


