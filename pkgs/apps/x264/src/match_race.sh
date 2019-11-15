#!/bin/bash

src="log.gtsan4"
dst="log.tsan4"

#src="log.tsan4"
#dst="log.gtsan4"


#races=`grep "#0" log.gtsan4 |sort|uniq|cut -d'(' -f1|uniq|grep parsec|rev|cut -d'/' -f1|rev`
races=`grep "#0" $src |sort|uniq|cut -d'(' -f1|uniq|grep parsec|rev|cut -d'/' -f1|cut -d':' -f2-|rev|uniq`

rc=0
frc=0

for r in $races; do
	let rc+=1
	res=`grep $r $dst|head -n1`
	if [ "$res" != "" ]; then
		let frc+=1
	fi
	echo "$r=>$res"
done

echo "$rc=>$frc"

