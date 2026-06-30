#!/bin/bash
# ==============================================================================
# Script Name: system_info.sh
# Description: Displays and logs basic system resource usage metrics.
# ==============================================================================

# Variables
LOG_FILE=../logs/system_log_$(date +%Y%m%d).log [cite: 45]

# Using a function to bundle output so it can easily display to stdout AND save to file
generate_report() {
    echo "=================================================="
    echo "Welcome to the System Info Report! Created by: anas farihin" [cite: 40]
    echo "=================================================="
    echo "Current Timestamp : $(date)" [cite: 41]
    echo "Host Machine      : $(hostname)"
    echo "--------------------------------------------------"
    
    echo -e "\n[1] Disk Usage:" [cite: 42]
    df -h /
    
    echo -e "\n[2] Memory Usage:" [cite: 43]
    free -h
    
    echo -e "\n[3] Top 5 Resource-Consuming Processes:" [cite: 44]
    ps -eo pid,cmd,%cpu,%mem --sort=-%cpu | head -n 6
    echo "=================================================="
}

# Run function, show output in terminal, and tee it transparently into the log file [cite: 45]
generate_report | tee "$LOG_FILE"
