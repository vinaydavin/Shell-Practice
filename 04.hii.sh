#! /bin/bash
logs_dir="/var/log/shell-script"
mkdir -p $logs_dir

script_name=$( echo $0 | cut -d "." -f1 )
log_file="$logs_dir/$script_name.log" | tee -a $log_file
echo "script started at: $(date)" | tee -a $log_file