#!/bin/bash
echo "Install Java..."
sudo apt install default-jre -y
java -version
sudo apt install default-jdk -y
javac -version
echo "Install Jenkins..."
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
echo "Start Jenkins..."
sudo systemctl start jenkins
sudo systemctl status jenkins
echo "Admin Password is:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword