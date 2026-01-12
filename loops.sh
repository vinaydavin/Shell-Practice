#!/bin/bash

userid=$(id -u)

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
reset="\e[0m"

logs_dir="/var/log/shell-script"
mkdir -p ${logs_dir}

script_name=$(basename "$0" .sh)
log_file="${logs_dir}/${script_name}.log"

echo "Script started at: $(date)" | tee -a ${log_file}

if [ $userid -ne 0 ]; then
  echo -e "${yellow}You must be root to run this script.${reset}" | tee -a ${log_file}
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$2 installation ${red}FAILED${reset}" | tee -a ${log_file}
    exit 1
  else
    echo -e "${green}$2 installed successfully${reset}" | tee -a ${log_file}
  fi
}

install_pkg(){
  rpm -q $1 &>> ${log_file}
  if [ $? -ne 0 ]; then
      dnf install $1 -y &>> ${log_file}
      rc=$?
      validate $rc $1
  else
      echo -e "${green}$1 already installed${reset}" | tee -a ${log_file}
  fi
}

install_pkg net-tools
install_pkg wget
