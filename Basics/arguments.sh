#!/bin/bash

# We use to store the argument as ${arg_value}

echo "This is a ping script"
SCRIPT_NAME=${0}
TARGET=${1}

echo "Running the script ${SCRIPT_NAME}..."
echo "Pinging the target : ${TARGET}..."
ping "$TARGET"
