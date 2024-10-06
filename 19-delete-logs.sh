#!/bin/bash


<<comment

find file based on size find /path/to/search -type f -size +SIZE[c|k|M|G]
Size Options
+SIZE: Finds files larger than the specified size.
-SIZE: Finds files smaller than the specified size.
SIZE: Finds files that match the exact size.

comment

SOURCE_DIR="/home/ec2-user/logs"


G=[32m
Y=[33m
R=[31m
N=[0m

log_info() {
    echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m"  # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m"  # Red for errors
}

#\033 or \e we can use 

# log_info() {
#     echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  &>>"$LOG_FILE" # Green for info
# }

# log_warning() {
#     echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m" &>>"$LOG_FILE" # Yellow for warnings
# }

# log_error() {
#     echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m" &>>"$LOG_FILE"  # Red for errors
# }



# log_info() {
#     echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  | tee -a "$LOG_FILE" # Green for info
# }

# log_warning() {
#     echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m" | tee -a "$LOG_FILE" # Yellow for warnings
# }

# log_error() {
#     echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m" | tee -a "$LOG_FILE"  # Red for errors
# }


if [ -d $SOURCE_DIR ]; then
    log_info "source directory exists"
else
    log_error "source directory doesnt exists"
    exit 1;
fi

Files=$(find $SOURCE_DIR -name "*.log" -mtime +14)
log_info "files list : $Files"

while IFS= read -r log_file
do
    log_info "deleting files: $log_file"
    rm -rf *
done <<< $Files
