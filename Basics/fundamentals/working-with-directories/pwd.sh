#!/bin/bash

echo "Welcome to the parent working directory..."
echo "The you are here sign can be displayed with the pwd command (Print Working Directory).
Go ahead, try it: Open a command line interface (also called a terminal, console or xterm)
and type pwd. The tool displays your current directory."
sleep 2
echo "Let us try it here right now.."
pwd
echo "That's the result.."
sleep 1
echo "Now let's change to home and check for the same..."
cd
pwd
echo "Did that return the same thing even after changing to home? I should have returned your real world home directory..!"
