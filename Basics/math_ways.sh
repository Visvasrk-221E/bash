#!/bin/bash

# Using the let method
let result="4 * 5"
echo "4 x 5 = ${result}"

# Using the double parenthesis method
echo "5^4 = $((5**4))"

# Using the expr command
result=$(expr 15 / 4)
echo "15 / 4 = ${result}"
