#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    log_error "please run the script with root previledges"
    exit 1;
fi

<<comment
validate_and_install funtion checks below steps
4. check whether software is already installed. if it already installed, inform the user it is already installed
5. if not , intall it.
6. check it is success or not.

comment

validate_and_install(){
    if [ $1 -ne 0 ]; then
        echo "installing $2 ... "
        dnf install $2 -y
        if [ $? -ne 0 ]; then
            log_error "$2 installation is failed ... please check it"
            exit 1;
        else
            log_info "$2 installed successfully..."
        fi
    else
        log_warning "$2 is already installed..... nothing to do."
    fi
}

log_info() {
    echo -e "\033[32m[INFO] $1\033[0m"   # Green for info
}

log_warning() {
    echo -e "\033[33m[WARNING] $1\033[0m" # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m[ERROR] $1\033[0m"   # Red for errors
}


dnf list installed mysql-serverr

validate_and_install $? mysql-serverrr

dnf list installed nginxx

validate_and_install $? nginxxx