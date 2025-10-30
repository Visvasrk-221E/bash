#!/bin/bash

echo "This is the change directory command : cd"
echo "You may pull up its manpage just like that to check it's capability. If you really needed a documentation, else, just help command..."
cd --help
echo "Syntax : cd <path of directory> "
echo ""
sleep 1
echo "Let's try that -P flag right here, changing to the home directory..."
cd -P
sleep 1
echo "Hello speaking from home directory. Something happend? "
sleep 1
echo ""
echo "Combine the e key also..."
cd -P -e
echo "hey there!"
pwd
sleep 1
echo ""
echo "Let's just try the single e. "
cd -e
pwd
echo "Anything?"
echo ""
echo ""
echo "Let's go with some shorthands..."
sleep 3
clear
echo "cd ~ or cd : This is shorthand for the home directory by default..."
echo "cd $HOME is also a shorthand for home directory using variable for home path..."
cd ~ && ls; echo "Speakinf from tiddle home..."
cd
cd $HOME
sleep 2
echo ""
echo "What to know how that $HOME looks like?"
echo "echo $HOME"
echo "$HOME"
sleep 2
echo ""

echo "Also if you want to move to parent directory, use cd .."
echo "Progressive ? use cd ../../"
echo "Need more? use cd ../../../../../../<how much ever you like>"
cd ..; echo "Currently in $PWD"
cd ../../; echo "Currently in $PWD"
sleep 
echo ""

echo "Transport to previous directory using the cd - shorthand..."
cd -
sleep 2
