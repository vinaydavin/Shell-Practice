#! /bin/bash
userid=$(id -u)

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
reset="\e[0m"

echo "zero"
if [ $userid -ne 0 ]; then
  echo -e "${yellow}You must be root to run this script. ${reset}"
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$2 installation ${red} failed. ${reset}"
    exit 1
  else
    echo -e"${green}$2 installed successfully.${reset}"
  fi
}
dnf install net-tools -y
validate $? "net-tools"

dnf install wget -y
validate $? "wget"

dnf install curl -y
validate $? "curl"

