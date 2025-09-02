#!/bin/bash

# Launch YAD form
user_input=$(yad --form --title="Secure Login" --text="Enter your credentials" --field="Username" --field="Password:H" --center --width=400 --height=200)

# Check if cancel was pressed
if [[ $? -ne 0 ]]; then
	yad --info --text="Login Cancelled"
	exit 1
fi

# Parse input
username=$(echo "$user_input" | cut -d'|' -f1)
password=$(echo "$user_input" | cut -d'|' -f2)

# Simple Verivication (demo only)
if [[ "$username" == "admin" && "$password" == "Sanjay@admin2025" ]]; then
	yad --info --text="Login Successful!, Welcome $username"
else
	yad --error --text="Access Denied. Invalid Credentials."
fi
