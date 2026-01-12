#! /bin/bash
userid=$(id -u)

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
reset="\e[0m"

if [ $userid -ne 0 ]; then
  echo -e "${yellow}You must be root to run this script. ${reset}"
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$2 installation ${red} failed. ${reset}"
    exit 1
  else
    echo -e "${green}$2 installed successfully.${reset}"
  fi
}

dnf list installed $2
if [ $? -ne 0 ]; then
    dnf install $2 -y
    validate $? "curl"
else
    echo -e "${green}net-tools is already installed.${reset}"
fi

dnf list installed $2
if [ $? -ne 0 ]; then
    dnf install $ -y
    validate $? "wget"
else
    echo -e "${green}wget is already installed.${reset}"
fi

