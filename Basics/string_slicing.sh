#!/bin/bash

world="Hello World"
sliced=$(expr "$world" : 'Hello \(.*\)ld')

echo "$world"
echo "$sliced"

health="Health : 200"
echo "$health"
health=$(expr "$health" : 'Health : \(.*\)')
echo "Health : $health"
health=$(($health - 100))
echo "Health : $health"


