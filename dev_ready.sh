#! /bin/bash

#PURPOSE: Install the necessary software and make laptop development ready.
#AUTHOR: Chaitanya Gaikwad
#MODIFIED ON: 04.11.2021
#NOTE: java7, sqldeveloper and Globalprotect VPN is downloaded before running this script.

#Update and Upgrade
sudo apt-get update
sudo apt-get upgrade

#GIT
sudo apt install git

#GRADLE
sudo apt install gradle

#Virtualbox
sudo apt install virtualbox
sudo apt install virtualbox-qt

#Vagrant
sudo apt install vagrant

#Python
sudo apt-get install python-pip
sudo apt-get install python3-pip

#JAVA 8
sudo apt install openjdk-8-jdk

#JAVA7
cd $HOME/Downloads
if [ -e jdk-7u80-linux-x64.tar.gz ]
then
	sudo tar xzf jdk-7u80-linux-x64.tar.gz
	sudo cp -r jdk1.7.0_80 /usr/lib/jvm/
fi
cd $HOME

#Eclipse
sudo apt install snap
sudo snap install --classic eclipse

#SQL Developer
cd $HOME/Downloads
if [ -e sqldeveloper_20.4.1-408.0006_all.deb ]
then
	sudo dpkg -i sqldeveloper_20.4.1-408.0006_all.deb
fi
cd $HOME

#Globalprotect VPN
cd $HOME/Downloads
if [ -e GlobalProtect_UI_deb-5.3.0.0-32.deb ]
then
	sudo dpkg -i GlobalProtect_UI_deb-5.3.0.0-32.deb
fi
cd $HOME

#Nameserver
nameserver=ip_of_server
sudo echo -e "nameserver $nameserver" >> /etc/resolv.conf

#registering java versions
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_80/bin/java 1
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/bin/java 2

#registering Python versions
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2