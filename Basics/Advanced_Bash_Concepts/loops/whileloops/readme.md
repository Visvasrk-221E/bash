#while

In bash, while loops allow you to run a code block until some test returns a
successful exit status code. You might use them in penetration testing to
continuously perform a port scan on a network and pick up any new hosts that join
the network, for example.

## Syntax

while some_condition; do
	# run commands while the condition is true
done


#A while loop

- A while loop starts with the keyword while, followed by an expression
that describes the condition. We then surround the code to be executed with the do
and done keywords, which define the start and end of the code block.

- You can use while loops to run some chunk of code infinitely by using
true as the condition; because true always returns a successful exit code, the
code will always run. Let’s use a while loop to repeatedly print a command to
the screen. Save this script to a file named basic_while.sh and run it.

# Demo Program
	#!/bin/bash
	while true; do
		echo "Looping..."
		sleep 2
	done
