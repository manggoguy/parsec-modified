#!/bin/bash

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

type=${1}

for bdir in ${benchdirs[*]}; do
	echo "---${bdir}---"
	pushd ${bdir}/src
	echo ../../../coe.sh `basename ${bdir}` ${type}
	../../coe.sh `basename ${bdir}` ${type}
	popd
done





