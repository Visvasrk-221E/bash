#!/bin/bash

# The variables $@ and $# shows the arguments and the number of arguments given respectively

# $0 : The name of the script file
# $1, 2, 3, ... : Positional arguments
# $# : The number of passed positional arguments
# $* : All positional arguments
# $@ : All positional arguments, where each argument is individually quoted.

echo "The total number of arguments are $# "
echo "The arguments are : $@ "
echo "The name of the script file : $0"
echo "All positional arguments : $*"
