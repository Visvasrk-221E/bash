#!/bin/bash

# Syntax

#if command; then
	# command was successful
#fi

#if ! command; then
	# command was unsuccessful
#fi

if touch demo.txt; then
	echo "File successfully created..."
fi

if ! touch /demo.txt; then
	echo "File creation uncessfull..."
fi
