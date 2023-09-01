#!/bin/bash
sudo apt update -y
sudo apt install openjdk-11-jdk -y

#curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

# sudo gpg --keyserver  http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key --recv-keys 5BA31D57EF5975CA
sudo apt update
sudo apt install jenkins -y

sudo systemctl enable --now jenkins
sudo ufw allow 8080
sudo ufw enable


