#!/usr/bin/env bash

# If you want to terminate this script anywhere before completion to save time,
# use the "exit" command in this script after the thing you are playing with
# and you will be able to terminate the vagrant up progress in your terminal

export DEBIAN_FRONTEND="noninteractive"

# Update Package List

apt-get update

# Update System Packages

apt-get -y upgrade

# Enable SSH login

sed -i '/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Install a nearly unusable desktop environment

apt-get -y install xorg xterm

rm /etc/alternatives/x-terminal-emulator
ln -s /usr/bin/xterm /etc/alternatives/x-terminal-emulator

apt-get -y install xorg openbox obmenu

rm /usr/bin/python

ln -s /usr/bin/python2.7 /usr/bin/python

mkdir -p /home/vagrant/.config/openbox

echo "LANG=en_US.UTF8" > /home/vagrant/.config/openbox/environment

cp /etc/xdg/openbox/menu.xml /home/vagrant/.config/openbox/rc.xml

cp /etc/xdg/openbox/menu.xml /home/vagrant/.config/openbox/menu.xml

chown -R vagrant:vagrant /home/vagrant/.config

# Start the desktop environment with:
# startx

# Install Chrome browser

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update
apt-get -y install google-chrome-stable

# Install Firefox

apt-get -y install firefox

# Install NodeJS

# install n

# n is a nodeJS version manager tool similar to rvm and nvm
# n allow you to install several versions of nodeJS side by side
# if you need a specific version you may "use" that version of node

# todo: check n script against expected hash

echo "Installing NodeJS"

curl -s -L https://git.io/n-install | bash -s -- -y

# make n available to the shell

. /root/.bashrc

# Install the latest stable node
/root/n/bin/n -q stable

# update the nodeJS software package manager

# ToDo: check npm script against expected hash

npm install -g npm@latest

chown -R vagrant:vagrant /home/vagrant/Website/tests
