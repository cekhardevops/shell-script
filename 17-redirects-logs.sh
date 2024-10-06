#!/bin/bash

<<comment

by default , shell redirects success outputs to file
ls -l > output.txt --> writes the logs info to file
lsss -l > output.txt--> dispaly error message on cli itself

1 for success
2 for error

ls -l 1>output.txt --> It redirects logs to output.txt only if the command executes successfully( it doesnt redirect failed/error )
ls -l 2>output.txt --> It redirects logs to output.txt only if the command fails to execute.(it doesnt redirect success message)
ls -l &>output.txt --> It redirects logs to output.txt regardless of success or failure

the above commands replace existing logs if file already have logs.

ls -l &>>output.txt --> It redirects/appends logs to output.txt regardless of success or failure

log_file : /var/log/shell-script/script-name-<timestamp>.log

comment

LOGS_DIR="/var/log/shell-script"
LOG_FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE=${LOGS_DIR}/${LOG_FILE_NAME}-${TIMESTAMP}.log

mkdir -p "$LOGS_DIR"

user_id=$(id -u)

validate_user(){
    if [ $1 -ne 0 ]; then
        log_error "please run the script with root preveledges"
        exit 1;
    fi
}

validate_user $user_id