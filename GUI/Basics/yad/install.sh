#!/bin/bash

# Update the system sources.
echo "[+] Updating the system source lists..."
sudo apt update -y
echo
echo "[+] Installing yad for gui..."
sudo apt install yad -y

