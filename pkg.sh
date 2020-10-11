#!/bin/sh

# Author: Alireza Ahmadi
# Email: alireza.amd3@gmail.com
# Description: This file will install all dependecies for ATS project

sudo apt install python3;
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: Python installation failed. [FAILED]"
else
  echo "NOTE: Python 3 installed successfully. [OK]"
  python3 --version
fi

sudo apt install python3-pip
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: pip installation failed. [FAILED]"
else
  echo "NOTE: pip installed successfully. [OK]"
  python3 -m pip --version
fi

python3 -m pip install django
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: django installation failed. [FAILED]"
else
  echo "NOTE: django installed successfully. [OK]"
  python3 -m django --version
fi

python3 -m pip install djangorestframework
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: djangorestframework installation failed. [FAILED]"
else
  echo "NOTE: pidjangorestframeworkp installed successfully. [OK]"
fi

python3 -m pip install gunicorn
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: gunicorn installation failed. [FAILED]"
else
  echo "NOTE: gunicorn installed successfully. [OK]"
fi


cd ~
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
#RETVAL= $?
if [$? -ne 0]
then
  echo "ERROR: nodejs installation failed. [FAILED]"
else
  echo "NOTE: nodejs installed successfully. [OK]"
  nodejs -v
fi


if [ -d "$1" ]
then
  cd $1
  echo "Current Directory is $1"
  git clone https://github.com/alirezaamd3/Applicant-Tracking-System.git
  #RETVAL= $?
  if [$? -ne 0]
  then
    echo "ERROR: Failed to clone project. [FAILED]"
  else
    echo "NOTE: Project has been cloned to the directory. [OK]"
  fi
else
  echo "ERROR: $1 is not a directory."
fi
