#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
NO_OF_DAYS=${3:-14}

#check source and destination provided


log_info() {
    echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m"  # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m"  # Red for errors
}


if [ $# -lt 2 ]; then
    log_error "USAGE:: $0 <source> <destination> <days(optional)"
fi

if [ ! -d $SOURCE_DIR ]; then
    log_error "$SOURCE_DIR doesnt exit... provide valid source path"
fi

if [ ! -d $DEST_DIR ]; then
    log_error "$DEST_DIR doesnt exit... provide valid destination path"
fi

Files=$(find $SOURCE_DIR -name "*.log" -mtime +$NO_OF_DAYS)

if [-n $Files]; then  # If $Files has any content (even spaces or a list of file names), -n returns true.
    log_info "Files are found"
else
    log_error "NO Files found"
fi