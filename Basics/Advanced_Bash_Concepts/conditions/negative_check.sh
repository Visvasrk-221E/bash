#!/bin/bash

FILE="ndemo.txt"

if [[ ! -f ${FILE} ]]; then
	echo "The file ${FILE} DNE..."
	echo "Creating the file : ${FILE}"
	touch "${FILE}"
	echo "Success !"
	exit 1
else
	echo "File already exists..."
fi
