#!/bin/bash

# Note we know that $@ is a variable for the arguments passed on to that file...

for ip_addr in $@; do
	echo "Doing something with ${ip_addr}..."
done
