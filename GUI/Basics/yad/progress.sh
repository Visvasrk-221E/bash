#!/bin/bash

# Advanced Progress Bar
(
	echo "10"; echo "#[+] Initializing Recon...\n";
	sleep 2
	echo "25"; echo "#[+] Establishing Reverse Channel...\n";
	sleep 2
	echo "50"; echo "#[+] Deploying Payload to Target...\n";
	sleep 2
	echo "75"; echo "#[+] Verifying Executino Path...\n";
	sleep 2
	echo "100"; echo "#[+] Operation Complete. Mission Success...\n";
	sleep 2
) | yad --progress \
	--title="Operation Black Panthom" \
	--text="\n	Tracking Execution Stages...\n" \
	--percentage=0 \
	--center \
	--width=600 \
	--height=100 \
	--auto-close \
	--auto-kill \
	--windo-icon=security

