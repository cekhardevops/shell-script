#!/bin/bash

USERID = $(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run the script with root previledges"
    exit 1;
fi

<<comment
this funtion checks below steps
4. check whether software is already installed. if it already installed, inform the user it is already installed
5. if not , intall it.
6. check it is success or not.

comment

validate_and_install(){
    if [ $1 -ne 0 ]; then
        echo "installing $1 ... "
        dnf install $1 -y
        if [ $? -ne 0 ]; then
            echo "$1 installation is failed ... please check it"
            exit 1;
        else
            echo "$1 installed successfully..."
        fi
    else
        echo "$1 is already installed..... nothing to do."
    fi
}

dnf list installed mysql-server

validate_and_install $?