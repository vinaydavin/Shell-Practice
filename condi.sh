#! /bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "You must be root to run this script."
  exit 1
fi

dnf install net-tools -y

if [$? -ne 0 ]; then
  echo "MySQL installation failed."
else
  echo "MySQL installed successfully."
fi
