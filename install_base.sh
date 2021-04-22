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
BLUE "Download bin2img..."
git clone https://github.com/c3er/bin2img.git /home/`logname`/Software/bin2img/
GREEN "Install bin2img..."
pip3 install -r /home/`logname`/Software/bin2img/requirements.txt

# From web
BLUE "Download hash-identifier..."
wget https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/hash-identifier/source-archive.zip -O /home/`logname`/Software/hash-identifier-archive.zip
7z x /home/`logname`/Software/hash-identifier-archive.zip -o/home/`logname`/Software/

BLUE "Download signsrch..."
wget http://aluigi.org/mytoolz/signsrch.zip -O /home/`logname`/Software/signsrch.zip
7z x /home/`logname`/Software/signsrch.zip -o/home/`logname`/Software/signsrch
GREEN "Install signsrch..."
make -C /home/`logname`/Software/signsrch/src
cp /home/`logname`/Software/signsrch/src/signsrch /home/`logname`/Software/signsrch/

# End
chmod -R o+wxr /home/`logname`/Software/




GREEN "Install over"