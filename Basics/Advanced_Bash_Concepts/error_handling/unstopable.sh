#!/bin/bash

# Trap all trappable signals and ignore them
for sig in SIGHUP SIGINT SIGQUIT SIGABRT SIGALRM SIGTERM SIGTSTP SIGTTIN SIGTTOU SIGPIPE SIGUSR1 SIGUSR2; do #CHLD
	trap "echo 'Access Denied for : ${sig}'" "${sig}"
done

trap "echo 'Access Denied for : ERR'" ERR
trap "echo 'Access Denied for : EXIT'" EXIT

echo "Hello World! "
echo "Try Stopping this unstopable..."

val=0
while true; do
	echo "The value is currently : ${val}"
	val=$(($val + 1))
	sleep 0.1
done
