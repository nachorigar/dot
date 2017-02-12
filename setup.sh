#!/usr/bin/env bash


 #----------------------------------------------------------------------------
 # "THE BEER-WARE LICENSE" (Revision 42):
 # <igrigar@protonmail.com> wrote this file. As long as you retain this notice
 # you can do whatever you want with this stuff. If we meet some day, and you
 # think  # this stuff is worth it, you can buy me a beer in return Nacho.
 #----------------------------------------------------------------------------

 # Last update: 10-02-17


# Basic script to install everything I consider usefull/necesary when the OS is
# freshly installed. It is divided into functions to ease of read an
# comprehension.
#==============================================================================#


#------------------------------------ DEBUG -----------------------------------#
# Force the script to end when any of the following conditions are met:
#   1.- (-e) A command is executed and it miserably fails.
#   2.- (-o) A command is executed succesfully but with novelties.
#   3.- (-u) A command tries to make use of a variable not defined beforehand.
#   4.- (-x) Show the instruction that is currently being executed.

set -eou pipefail


#---------------------------------- FUNCTIONS ---------------------------------#
official() {
    apt-get install -y ubuntu-restricted-extras build-essential \
        linux-headers-generic libtool-bin
    dpkg --add-architecture i386
    apt-get install -y vim ssh nmap cryptsetup screen tmux apg
    apt-get install -y manpages-es manpages-es-extra
    dpkg-reconfigure locales
    apt-get install -y rar unace p7zip-full p7zip-rar sharutils mpack arj
    apt-get install -y deborphan ppa-purge
    apt-get install -y vlc pdftk
    apt-get install -y arduino arduino-core git python-pip
    apt-get install -y transmission-daemon
    apt-get install texlive-full
}

unofficial() {
    # Numix icon theme.
    add-apt-repository ppa:numix/ppa
    apt-get update
    apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle
}


#----------------------------------- SCRIPT -----------------------------------#
# Root validation.
if [ $(whoami) = "root" ]; then
    official
    unofficial
fi
