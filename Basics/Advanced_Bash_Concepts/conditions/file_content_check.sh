#!/bin/bash

# The concept used here is the string comparision....
# Cat the output from two different files from the arguments with safety measures, store them in the variable.
# Check for their equivalence

FILE1=${1}
FILE2=${2}

echo "[+] Checking for the files' existence..."
if [[ -f ${FILE1} && -f ${FILE2} ]]; then
	echo "Both the files exist, file check success..."
else
	echo "Either file does not exist... Check and provide with the correct file..."
	exit 0
fi

echo ""
echo "[+] Catting the files..."
CONTENT1=$(cat "${FILE1}")
CONTENT2=$(cat "${FILE2}")

echo "Catting process success..."

echo ""
echo "[+] Checking for the string match..."
if [[ ${CONTENT1} == ${CONTENT2} ]]; then
	echo "The contents of the file are the exact match..."
else
	echo "The contents of the file doesn't exactly match, maybe slightest difference in string change..."
fi
echo "File compared successfully"

echo ""
echo "[+] Displaying the content of the files..."
echo "	[For $FILE1]"
cat "$FILE1"
echo ""
echo "	[For $FILE2]"
cat "$FILE2"
