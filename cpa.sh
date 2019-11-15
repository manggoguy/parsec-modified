#!/bin/bash

a=`find .|grep sniper-tcwithhot.bldconf`

for b in $a;do
	c=`basename $b`
	d=`echo $b|sed -e s/$c//g`
	e=`basename $b|sed -e s/tcwithhot/tcnohot/g`
	cp $b $d/$e
done

