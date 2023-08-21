#!/bin/bash

USERID=($id -u)

if [ $USERID -NE 0]
then
    echo "Error:: pls run the script with root access"
    exit 1
else
    echo "info::you are root user"
fi

yum install mysql -y