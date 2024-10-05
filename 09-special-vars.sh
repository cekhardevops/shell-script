#!/bin/bash

echo "All the variables passed to this script : ${@}"
echo "Number of variables passed to this script : ${#}"
echo "script name : ${0}"
echo "current working directory: ${PWD}"
echo "Use's Home directory : ${HOME}"
eval last_arg=\$$#
echo "first second last parameter pass to the script : $1 $2 $last_arg"
echo "PID of the script executing now: $$"
ls /nonexistent-directory
echo "exit status of previous command $?"
echo "hello"
echo "last argument of previous command $_"
sleep 100 &
echo "process id of last background task $!"