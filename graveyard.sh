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

declare -a matrix

# Construct the Matrix
for ((i=1;i<=$count;i++)); do
    for ((j=1;j<=$count;j++)); do
        matrix[$i,$j]=$RANDOM
    done
done
printMatrix

echo ${matrix[0,1]}

printMatrix
exit
#Parse text, filling in the matrix
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

printMatrix
# Matrix calculations


# Output Rank
