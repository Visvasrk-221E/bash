#!/bin/bash

# Assign an array
array1=(1 2 3 4 5 6 7 8 9 0)
array2=($(seq 1 100))
array3=([1]="Element 2" [2]="Element 3" [0]="Element 1")

# First element of the array
echo "$array1" "${array1[0]}"
echo "$array2" "${array2[0]}"
echo "$array3" "${array3[0]}"

# Complete array
echo "${array1[@]}" "${array1[*]}"
echo "${array2[@]}" "${array2[*]}"
echo "${array3[@]}" "${array3[*]}"

echo "${array1}"
