#!/bin/bash

FILE="demo.txt"

if [[ -f ${FILE} ]]; then
	echo "File exists"
	exit 1
else
	echo "File DNE, creating file..."
	touch "${FILE}"
	echo "Successfully File created..."
fi
