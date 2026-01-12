#! /bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo "$2 installation failed."
    exit 1
  else
    echo "$2 installed successfully."
  fi
}
dnf install net-tools -y
validate $? "net-tools"

dnf install wget -y
validate $? "wget"

validate $? "curl"
dnf install curl -y