#!/bin/bash

# Define colors...
RED=`tput bold && tput setaf 1`
GREEN=`tput bold && tput setaf 2`
YELLOW=`tput bold && tput setaf 3`
BLUE=`tput bold && tput setaf 4`
NC=`tput sgr0`

function RED(){
	echo -e "\n${RED}${1}${NC}"
}
function GREEN(){
	echo -e "\n${GREEN}${1}${NC}"
}
function YELLOW(){
	echo -e "\n${YELLOW}${1}${NC}"
}
function BLUE(){
	echo -e "\n${BLUE}${1}${NC}"
}

# Testing if root...
if [ $UID -ne 0 ]
then
	RED "You must run this script as root!" && echo
	exit
fi

mkdir /home/`logname`/Software


# From Repo
BLUE "Updating repositories..."
sudo apt update

BLUE "Installing git..."
sudo apt install -y git

BLUE "Installing nmap..."
sudo apt-get install -y nmap

BLUE "Installing docker..."
sudo apt-get install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `logname`

BLUE "Installing Wireshark..."
sudo apt-get install -y wireshark

BLUE "Installing Binwalk..."
sudo apt install -y binwalk

BLUE "Installing cmake..."
sudo apt install -y cmake

BLUE "Installing python..."
sudo apt install -y python

BLUE "Installing python3..."
sudo apt install -y python3

BLUE "Installing Pip3..."
sudo apt install -y python3-pip


# From git


# From web
BLUE "Download hash-identifier..."
wget https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/hash-identifier/source-archive.zip -O /home/`logname`/Software/hash-identifier-archive.zip
7z x /home/`logname`/Software/hash-identifier-archive.zip -o/home/`logname`/Software/


# End
chmod -R o+wxr /home/`logname`/Software/

