#!/bin/bash

user_id=$(id -u)

validate_user(){
    if [ $1 -ne 0 ]; then
        echo "please run the script with root preveledges"
        exit 1;
    fi
}
validate_and_install(){

    dnf list installed $1
    if [ $? -ne 0 ]; then
        echo "$1 is isntalling...."
        dnf install $1 -y
        if [ $? -ne 0 ]
            echo "$1 package not installed. please check..."
        elif
            echo "*****$1 package is installed successfully******"
        fi
    elif
        echo "$1 already isntalled...."
    fi
}




validate_user $user_id

for package in $@
do
    validate_and_install $package
done