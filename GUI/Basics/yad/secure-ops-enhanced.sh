#!/bin/bash

# TEMP file to store outputs
tempfile=$(mktemp)

# YAD GUI with improved design
yad --notebook \
  --key=$$ \
  --title="Secure Operations Panel" \
  --window-icon=security \
  --center \
  --width=600 --height=400 \
  --tab="Login" --form \
    --columns=1 \
    --separator="|" \
    --field="Username:gtk-guest" \
    --field="Password:gtk-dialog-authentication:H" \
    --field="2FA Token:security-high" \
  --tab="Operations" --form \
    --columns=1 \
    --separator="|" \
    --field="Target IP:network-wired" \
    --field="Payload Type:CBR|Meterpreter|Reverse Shell|Bind Shell" \
    --field="Execute Now:CHK" \
  --tab="Settings" --form \
    --columns=1 \
    --separator="|" \
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

# Enhanced Output
yad --info --title="Mission Summary" --text="
<b>AUTH</b>
Username: <tt>$username</tt>
2FA Token: <tt>$token</tt>

<b>OPERATIONS</b>
Target: <tt>$target_ip</tt>
Payload: <tt>$payload_type</tt>
Execute: <tt>$exec_now</tt>

<b>SETTINGS</b>
Logging: <tt>$logs</tt>
Encryption: <tt>$encryption</tt>
Exit on Failure: <tt>$exit_fail</tt>
" --width=500 --height=300
