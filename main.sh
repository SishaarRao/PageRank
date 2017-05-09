#!/bin/bash

count=`ls Pages/ | wc -l`

# Function for printing out the matrix
function printMatrix() {
    f1="%$((${#count}+1))s"
    f2=" %9s"
    
    printf "$f1" ''
    for ((i=1;i<=$count;i++)); do
	printf "$f2" $i
    done
    echo

    for ((j=1;j<=$count;j++)); do
	printf "$f1" $j
	for ((i=1;i<=$count;i++)); do
	    printf "$f2" ${matrix[$i,$j]}
	done
	echo
    done
    
}

# Construct the Matrix
for ((i=1;i<=$count;i++)) do
    for ((j=1;j<=$count;j++)) do
        matrix[$i,$j]=0
    done
done
    
printMatrix

#Parse text, filling in the matrix
for page in `ls Pages/*.html`; do
    denom=`grep -c "link:to:*" $page`
    echo `grep "link:to:*" $page`
    currPage=${page:10:1}
    echo $currPage
    
done
# Matrix calculations


# Output Rank
