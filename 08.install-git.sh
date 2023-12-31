#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: pls run the script with root access"
    exit 1
#else
  # echo "info::you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation error"
    exit 1
else
echo "Installation of mysql is success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
    echo "Installation postfix error"
    exit 1
else
echo "Installation of postfix is success"
fi