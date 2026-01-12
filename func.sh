#!/bin/bash

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_dir="/var/log/shell-script"
mkdir -p ${logs_dir}

script_name=$( echo $0 | cut -d "." -f1 )
log_file="${logs_dir}/${script_name}.log"

echo "script started at: $(date)" | tee -a ${log_file}

if [ $userid -ne 0 ]; then
  echo -e "${Y}You must be root to run this script.${N}"
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$2 installation ${R}failed.${N}" | tee -a ${log_file}
    exit 1
  else
    echo -e "${G}$2 installed successfully.${N}" | tee -a ${log_file}
  fi
}

# Check and install net-tools
rpm -q net-tools &>> ${log_file}
if [ $? -ne 0 ]; then
    dnf install net-tools -y &>> ${log_file}
    validate $? "net-tools"
else
    echo -e "${G}net-tools already installed.${N}" | tee -a ${log_file}
fi

# Check and install wget
rpm -q wget &>> ${log_file}
if [ $? -ne 0 ]; then
    dnf install wget -y &>> ${log_file}
    validate $? "wget"
else
    echo -e "${G}wget already installed.${N}" | tee -a ${log_file}
fi

for package in $@
do
    echo "package: $package"
    rpm -q $package &>> ${log_file}
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> ${log_file}
        validate $? "$package"
    else
        echo -e "${G}$package already installed.${N}" | tee -a ${log_file}
    fi
done