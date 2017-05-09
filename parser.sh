#!/bin/bash

for page in `ls Pages/*.html`; do
    denom=`grep -c "link:to:*" $page`
    links=`grep "link:to:*" $page`
    col=${page:10:1}
    echo $denom
    echo
    for link in $links; do
	row=${link:12:1}
	echo $row
	echo $col
	#matrix[$row,$col]=$(echo "scale=6; 1/$denom" |bc)
	matrix[$row,$col]=1
    done
done
