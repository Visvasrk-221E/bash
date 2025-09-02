#!/bin/bash

# Write a program to check if a user is root or not...

check_root() {
	if [[ "${EUID}" -eq "0" ]]; then
		return 0
	else
		return 1
	fi
}

is_root=$(check_root)
if [[ "${is_root}" -eq "0" ]]; then
	echo "User is root!!!"
else
	echo "User is non-root!!!"
fi


