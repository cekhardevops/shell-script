#!/bin/bash

for i in 1 2 3 4 5 6 7 8 9
do 
    echo "num is $i"
    echo "@@@@@@@@@@@@@@@@@@@@"
done 


for i in {1..9}
do
    echo "num is $i"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@
done

fetch list of files in the specified directory.
for file_name in ${PWD}/*
do
    echo "file name : $file_name"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
done

list=("chandra" "sekhar" "reddy")

for name in ${list[@]}
do
    echo "names : $name"
done