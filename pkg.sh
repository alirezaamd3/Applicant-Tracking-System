#!/bin/sh
# Author: Alireza Ahmadi
# Email: alireza.amd3@gmail.com
# Description: This file will install all dependecies for ATS project
if ! sudo apt install python3;
then
  echo "ERROR: Python installation failed. [FAILED]"
else
  echo "NOTE: Python 3 installed successfully. [OK]"
  python3 --version
fi
if ! sudo apt install python3-pip;
then
  echo "ERROR: pip installation failed. [FAILED]"
else
  echo "NOTE: pip installed successfully. [OK]"
  python3 -m pip --version
fi
if ! python3 -m pip install django;
then
  echo "ERROR: django installation failed. [FAILED]"
else
  echo "NOTE: django installed successfully. [OK]"
  python3 -m django --version
fi
if ! python3 -m pip install djangorestframework;
then
  echo "ERROR: djangorestframework installation failed. [FAILED]"
else
  echo "NOTE: pidjangorestframeworkp installed successfully. [OK]"
fi
if ! python3 -m pip install gunicorn;
then
  echo "ERROR: gunicorn installation failed. [FAILED]"
else
  echo "NOTE: gunicorn installed successfully. [OK]"
fi
echo "PATH=\"~/.local/bin/:\$PATH\"" >> ~/.bashrc
source ~/.bashrc
cd ~ || exit
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
if ! sudo apt install nodejs;
then
  echo "ERROR: nodejs installation failed. [FAILED]"
else
  echo "NOTE: nodejs installed successfully. [OK]"
  node -v
  npm -v
fi
if [ -d "$1" ]
then
  cd "$1" || exit
  echo "Current Directory is $1"
  if ! git clone https://github.com/alirezaamd3/Applicant-Tracking-System.git;
  then
    echo "ERROR: Failed to clone project. [FAILED]"
  else
    echo "NOTE: Project has been cloned to the directory. [OK]"
  fi
else
  echo "ERROR: $1 is not a directory."
fi

exit
