#!/bin/bash

log_info() {
    echo -e "\033[32m[INFO] $1\033[0m"   # Green for info
}

log_warning() {
    echo -e "\033[33m[WARNING] $1\033[0m" # Yellow for warnings
}

log_error() {
    echo -e "\033[31m[ERROR] $1\033[0m"   # Red for errors
}

log_info "System is running smoothly."
log_warning "Disk space is getting low."
log_error "System failure!"