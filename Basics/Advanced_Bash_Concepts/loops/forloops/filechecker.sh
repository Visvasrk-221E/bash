#!/bin/bash

for i in $(ls -la); do
	if [[ -f "${i}" ]]; then
		echo "FileName : ${i}"
		echo "[File Status]"
		echo "$(file $i)"
		echo ""
	fi
done
