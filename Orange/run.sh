#!/bin/bash

##############
### Colors ###
##############

BLACK="\033[1;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
EOC="\033[0;0m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"


#--------------#
#   0. Setup   #
#--------------#

# 0.1 Get the OS distribution
OS=$(cat /etc/os-release | awk 'NR==1{print $1}' |  cut -d'"' -f 2)
if [ $OS != "Ubuntu" ] ;
then
    echo -e "$RED Please use a Ubuntu distribution $EOC"
    exit 1
fi  

# Je vais coder pour windows après. ça sera une commande de ce style
## winget install --id  UniversityofLjubljana.Orange 


# 0.2 Update & upgrade & autoremove & autoclean
echo -e -n "\n$CYAN Updating ... $EOC" | sort
sudo apt update -y &> /dev/null && sudo apt full-upgrade -y &> /dev/null && sudo apt autoremove -y &> /dev/null && sudo apt autoclean -y &> /dev/null
echo -e "$GREEN  Done $EOC"

#------------------------------#
#   1. Packages Installation   #
#------------------------------#

install_pip() {
    if ! pip list | grep $1  &>/dev/null ;
    then
        echo -e -n "$PURPLE Installation of $1 $EOC"
        pip install $1
        if pip list | grep $1  &>/dev/null ;
        then
            echo -e -n "$GREEN Successful Installation of $1 $EOC"
        else
            echo -e "$RED ERROR : $1 has not been downloaded. $EOC"
            exit 1
        fi
    else
        echo -e -n "$GREEN $1 already installed \n$EOC"
    fi
}

install_pip PyQt5
install_pip PyQtWebEngine
install_pip Orange3