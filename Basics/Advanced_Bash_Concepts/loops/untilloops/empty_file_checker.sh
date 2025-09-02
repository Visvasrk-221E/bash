#!/bin/bash

FILE="release.txt"
touch "${FILE}"

until [[ -s "${FILE}" ]]; do
	echo ""
	echo "The file is an empty file..."
	echo "Checking again in 2 seconds..."
	echo "______________________________________________________________________________________________________________________"
	sleep 2
done

echo "Success! The file has got some content in it, someone edited it..."
