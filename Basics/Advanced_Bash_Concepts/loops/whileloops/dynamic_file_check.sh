#!/bin/bash

THE_FILE="release.txt"
while [[ ! -f "${THE_FILE}" ]]; do
	echo ""
	echo "The stop file is not found..."
	echo "Filename : ${THE_FILE}"
	echo "Please download that file from the link : https://themalwarerelease.com/releasefiles/version/v0.1/release.txt"
	echo "Place it in the folder...."
	echo "You will be relived once done..."
	echo "________________________________________________________________________________________________________________"
	echo "Rechecking for file in 2 seconds..."
	sleep 2
done

echo "Success, the file is found..."
echo "You are relieved..."
