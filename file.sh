#!/bin/bash
# //This configuration file is to install jenkins in amazon linux!!!


sudo -i
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
    sudo yum upgrade
    sudo dnf install java-17-amazon-corretto -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    yum install httpd -y
    systemctl start httpd
    systemctl enable httpd 
    cat /var/lib/jenkins/secrets/initialAdminPassword > /var/www/html/index.html

