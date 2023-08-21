#!/bin/bash


DATE= $(date +%F-%H-%M-%S)
SCRIPT-NAME= $0
LOGFILE= /tmp/$SCRIPT-NAME.$DATE.log
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...Failure"
        exit 1
    else
        echo "$2...Success"
fi
}
if [ $USERID -ne 0 ]
then
    echo "Error:: pls run the script with root access"
    exit 1
#else
  # echo "info::you are root user"
fi

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install postfix -y

VALIDATE $? "Installing postfix"