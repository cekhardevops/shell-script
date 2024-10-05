#!/bin/bash

NUMBER=$1

# if [ NUMBER>10 ]; then
#     # Code to run if condition is true
# elif [ another_condition ]; then
#     # Code to run if another_condition is true
# else
#     # Code to run if no conditions are true
# fi

# Operator	Meaning
# -eq	Equal to
# -ne	Not equal to
# -lt	Less than
# -le	Less than or equal to
# -gt	Greater than
# -ge	Greater than or equal to

echo "given number is : $NUMBER"

if [ $NUMBER -gt 20 ]; then
    echo "given number $NUMBER is greater than 20"
elif [ $NUMBER -eq 20 ]; then
    echo "given number $NUMBER is equal to 20"
else
    echo "given number $NUMBER is less than 20"
fi