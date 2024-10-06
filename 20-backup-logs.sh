#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
NO_OF_DAYS=${3:-14}

#check source and destination provided

if [ $# -lt 2 ]; then
    log_error "USAGE:: $0 <source> <destination> <days(optional)"
fi


log_info() {
    echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m"  # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m"  # Red for errors
}