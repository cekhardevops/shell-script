#!/bin/bash

<<comment

steps to install software using shell
1. check whether user has root access
2. if user has root access, proceed with script
3. other throw error
4. check whether software is already installed. if it already installed, inform the user it is already installed
5. if not , intall it.
6. check it is success or not.

comment

user_id=$(id -u)

if [ $? -nq 0 ]; then
    echo "Please execute the script the root previledges"
    exit 1;
else
    dnf list installed mysql-server
    if [ $? -nq 0 ]; then
        dnf install mysql-server -y
        echo "mysql installing...."
    else
        echo "mysql already installed on this server"
    fi
fi