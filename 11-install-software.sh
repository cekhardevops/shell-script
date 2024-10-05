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
fi

dnf list installed mysql-server
if [ $? -ne 0 ]; then
    echo "mysql installing...."
    dnf install mysql-server -y
    if [ $? -ne 0 ]; then
        echo "mysql installation gets failed... Please check again"
        exit 1;
    else
        echo "mysql server installation is success..."
    fi
else
    echo "mysql already installed on this server"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    echo "prearing to install nginx server......"
    dnf install nginx -y
    if [ $? -ne 0 ]; then
        echo "nginx installation is failed... Please check.."
    elif
        echo "nginx is successfully installed..."
    fi
elif
    echo "nginx already installed on this server"
fi
