#!/bin/bash

limit=${1}
value=1
alive=true
echo "Loop stops when reaches $limit"
while $alive; do
	if [[ $value -eq $limit ]]; then
		alive=false
	fi
	echo "Reached ${value}"
	value=$(($value + 1))
	sleep 1
done

echo "Success"
