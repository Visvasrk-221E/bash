#!/bin/bash

# & : Sends a command to the background
# && : Used as a logical AND. The second command in the expression will be evaluated only if the first command evaluated to true.
# (and) : Used for command grouping
# ; : Used as a list terminator. A command following the terminator will run after the preceding command has finished, regardless of whether it evalutes to true or not
# | : Redirects the output of a command as input to another command.
# || : Used as a logical OR. The second command will run if the first one evaluates to false.
# () : Used for the grouping

sleep 10 &
echo "Creating a file demo..."
touch demo

echo "Deleting the file demo"
rm demo

touch demo && rm demo

(ls; ps)

ls; ps; whoami

lzl | echo "Invalid command : lzl"

