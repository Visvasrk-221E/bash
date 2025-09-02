#!/bin/bash

# TEMP file to store outputs
tempfile=$(mktemp)

# YAD Main GUI with Tabs
yad --notebook \
  --key=$$ \
  --title="Secure Operations Panel" \
  --window-icon=security \
  --center \
  --width=500 --height=350 \
  --tab="Login" --form \
    --field="Username" \
    --field="Password:H" \
    --field="2FA Token" \
  --tab="Operations" --form \
    --field="Target IP" \
    --field="Payload Type:CBR|Meterpreter|Reverse Shell|Bind Shell" \
    --field="Execute Now:CHK" \
  --tab="Settings" --form \
    --field="Enable Logs:CHK" \
    --field="Encryption Level:CBR|Low|Medium|High|Top Secret" \
    --field="Exit on Failure:CHK" \
  > "$tempfile"

# Check for cancel
if [[ $? -ne 0 ]]; then
  yad --info --text="Operation Cancelled"
  rm "$tempfile"
  exit 1
fi

# Read and split data
IFS="|" read -r username password token \
             target_ip payload_type exec_now \
             logs encryption exit_fail < "$tempfile"

# Cleanup
rm "$tempfile"

# Basic Output
yad --info --title="Mission Summary" --text="

_____________________________________
AUTH

User: $username
2FA: $token
_____________________________________
OPS

Target: $target_ip
Payload: $payload_type
Execute: $exec_now
_____________________________________
SETTINGS

Logging: $logs
Encryption: $encryption
Fail Exit: $exit_fail
_____________________________________
"
