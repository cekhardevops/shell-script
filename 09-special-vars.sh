#!/bin/bash

echo "All the variables passed to this script : ${@}"
echo "Number of variables passed to this script : ${#}"
echo "script name : ${0}"
echo "current working directory: ${PWD}"
echo "first second last parameter pass to the script : $1 $2 ${!#}"
echo "PID of the script executing now: $$"