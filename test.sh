#!/bin/bash

declare -a array
declare -a array2

array2[0]=0
array2[1]=1
array2[2]=2
array2[3]=3


echo ${array2[0]}
array[0]=${array2}
echo ${{array[0]}[1]}
