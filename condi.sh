#! /bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "You must be root to run this script."
fi

dnf install mysql -y

if [$? -ne 0 ]; then
  echo "MySQL installation failed."
else
  echo "MySQL installed successfully."
fi
