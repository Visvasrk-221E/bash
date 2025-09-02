#!/bin/bash

# > : Redirects stdout to a file
# >> : Redirects stdout to a file by appending it to the existing content
# &> or >& : Redirects stdout and stderr to a file
# &>> : Redirects stdout and stderr to a file by appending it to the existing content
# < : Redirects input to a command
# << : Called as a here document or heredoc which redirects multiple input lines to a command
# | : Redirects the output of a command as input to another command


echo "Hello World!" > output.txt
cat output.txt
echo "Goodbye!" >> output.txt
cat output.txt
ls -l / &> stdout_and_stderr.txt
cat stdout_and_stderr.txt

# Streams file description number
ls -l / 1> stdout.txt 2> stderr.txt
cat < output.txt
ls -l / | grep "bin"

