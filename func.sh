#!/bin/bash

userid=$(id -u)
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
reset="\e[0m"

logs_dir="/var/log/shell-script"
mkdir -p ${logs_dir}

script_name=$( echo $0 | cut -d "." -f1 )
log_file="${logs_dir}/${script_name}.log"

echo "script started at: $(date)" | tee -a ${log_file}

if [ $userid -ne 0 ]; then
  echo -e "${yellow}You must be root to run this script.${reset}"
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$2 installation ${red}failed.${reset}" | tee -a ${log_file}
    exit 1
  else
    echo -e "${green}$2 installed successfully.${reset}" | tee -a ${log_file}
  fi
}

# Check and install net-tools
rpm -q net-tools &>> ${log_file}
if [ $? -ne 0 ]; then
    dnf install net-tools -y &>> ${log_file}
    validate $? "net-tools"
else
    echo -e "${green}net-tools already installed.${reset}" | tee -a ${log_file}
fi

# Check and install wget
rpm -q wget &>> ${log_file}
if [ $? -ne 0 ]; then
    dnf install wget -y &>> ${log_file}
    validate $? "wget"
else
    echo -e "${green}wget already installed.${reset}" | tee -a ${log_file}
fi

for package in $@
do
    echo "Processing package: $package"
done