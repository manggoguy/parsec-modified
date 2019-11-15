#!/bin/bash

dirs=`find pkgs/ -name bin |grep inst/amd64-linux.gcc-tcmalloc/bin`

for d in $dirs;do
	echo "=>Inspecting dir $d"
	for f in `ls $d/`;do
		ldd $d/$f|grep -i tcmalloc
	done
done

