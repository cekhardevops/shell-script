#!/bin/bash

<<comment

this script follow below steps
1. check whether user has root access
2. if user has root access, proceed with script
3. other throw error
4. check whether software is already installed. if it already installed, inform the user it is already installed
5. if not , intall it.
6. check it is success or not.

comment

user_id=$(id -u)

# root id is value always 0

if [ $user_id -ne 0 ]; then
    echo "Please execute the script the root previledges"
    exit 1;
else
    dnf list installed mysql-server
    if [ $? -ne 0 ]; then
        echo "mysql installing...."
        dnf install mysql-server -y
        if [ $? -ne 0 ]; then
            echo "mysql installation gets failed... Please check again"
        else
            echo "mysql server installation is success..."
        fi
    else
        echo "mysql already installed on this server"
    fi
fi