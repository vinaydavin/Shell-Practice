#! /bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
  echo "You must be root to run this script."
fi
