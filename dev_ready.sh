#! /bin/bash

#PURPOSE: Install the necessary software and make laptop development ready.
#AUTHOR: Chaitanya Gaikwad
#MODIFIED ON: 02.11.2024

#Update and Upgrade
sudo apt update -y 
sudo apt upgrade -y

#JAVA
sudo apt install openjdk-11-jdk

#registering Python versions
cd /usr/bin
rm python python3
sudo ln -s python2.7 python
sudo ln -s python3.6 python3

sudo update-alternatives --install /usr/bin/python python /usr/bin/python 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2

sudo update-alternatives --set python /usr/bin/python3

#Python-pip
sudo apt install python-pip
sudo apt install python3-pip

#GIT
sudo apt install git

#Virtualbox
sudo apt install virtualbox
sudo apt install virtualbox-qt

#Visual Studio Code
cd Downloads
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
code_LTS=$(ls | grep -i deb | grep -i code)
sudo apt install ./$(code_LTS)

# Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Kubernetes ( Micro K8s )
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER

# Terraform
cd Downloads
git clone https://github.com/hashicorp/terraform.git
cd terraform
go install
echo $PATH
mv ~/Downloads/terraform /usr/local/bin/
touch ~/.bashrc
terraform -install-autocomplete

# ansible
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
