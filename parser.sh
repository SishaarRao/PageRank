#!/bin/bash

for page in `ls Pages/*.html`; do
    denom=`grep -c "link:to:*" $page`
    links=`grep "link:to:*" $page`
    col=${page:10:1}
    for link in $links; do
	row=${link:12:1}
	echo `expr $row - 1`
	echo `expr $col - 1`
	echo $(echo "scale=6; 1/$denom" | bc)
    done
done
