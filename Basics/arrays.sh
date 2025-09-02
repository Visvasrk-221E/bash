#!/bin/bash

array=(1 2 3 4 5 6 7 8 9 0)

# Print all the elements of the array
echo "${array[*]}"

# Note, array alone prints the first element only
echo "${array}"
echo "$array"
# Printing the element of the array using indexing
echo "${array[5]}"
