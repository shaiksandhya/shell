#!/bin/bash


DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R Failure $N"
        exit 1
    else
        echo  -e "$2...$G Success $N"
fi
}

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Error:: pls run the script with root access"
    exit 1
#else
  # echo "info::you are root user"
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MYSQL"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing postfix"