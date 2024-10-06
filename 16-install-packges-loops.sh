#!/bin/bash

user_id=$(id -u)

validate_user(){
    if [ $1 -ne 0 ]; then
        echo "please run the script with root preveledges"
        exit 1;
    fi
}

validate_user $user_id