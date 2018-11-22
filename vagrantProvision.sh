#!/usr/bin/env bash

# If you want to terminate this script anywhere before completion to save time,
# use the "exit" command in this script after the thing you are playing with
# and you will be able to terminate the vagrant up progress in your terminal

export DEBIAN_FRONTEND="noninteractive"

# Update Package List

apt-get update

# Update System Packages

apt-get -y upgrade

# Autologin vagrant user

sed -i '$ d' /etc/init/tty1.conf
echo "exec /sbin/rungetty --autologin vagrant tty1" >> /etc/init/tty1.conf

# Enable SSH login

sed -i '/^PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd

# Install a nearly unusable desktop environment

apt-get -y install xorg xterm

rm /etc/alternatives/x-terminal-emulator
ln -s /usr/bin/xterm /etc/alternatives/x-terminal-emulator

apt-get -y install xorg openbox obmenu

ln -s /usr/bin/python2.7 /usr/bin/python

echo "LANG=en_US.UTF8" > /home/vagrant/.config/openbox/environment

cp /etc/xdg/openbox/menu.xml /home/vagrant/.config/rc.xml

cp /etc/xdg/openbox/menu.xml /home/vagrant/.config/menu.xml

# Start the desktop environment with:
# startx

# Install NodeJS

# install n

# n is a nodeJS version manager tool similar to rvm and nvm
# n allow you to install several versions of nodeJS side by side
# if you need a specific version you may "use" that version of node

# todo: check n script against expected hash

curl -s -L https://git.io/n-install | bash -s -- -y

# make n available to the shell

. /root/.bashrc

# The most recent lts version (v8.11.3 at this time) is installed with n

#/root/n/bin/n -q 6.14.3 # install this version, set to default, & switch to it

#/root/n/bin/n -d -q stable # just download the latest stable version (v10.8.0 at this time)

# Install the latest stable node
/root/n/bin/n -q stable

# update the nodeJS software package manager

# todo: check npm script against expected hash

curl -s -0 -L https://npmjs.com/install.sh | bash > /dev/null

npm install -g npm@latest

# Install Chrome browser

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt-get update
apt-get -y install google-chrome-stable

# Install Firefox

apt-get -y install firefox



cd /home/vagrant/tests

# Install the latest selenium, chromedriver, and geckodriver npm packages

npm install

chown -R vagrant:vagrant /home/vagrant/tests
