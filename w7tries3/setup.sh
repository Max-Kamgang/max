#!/bin/bash 
#Author : Max K
#Date : 28/08/2025
#Description : This script is used to initialised the Linux environment with all the necessary packages
#and this script will be launch autmatically during the Creation of the EC2 instance

sudo yum install git -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo yum install -y amazon-ecr-credential-helper
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install -y java-1.8.0-openjdk
sudo yum install -y wget
sudo yum update -y
sudo yum install cal -y
sudo useradd admin -c "Creating user admin  with sudo previlages"
vi /etc/ssh/sshd_config
sudo groupadd docker
sudo useradd -aG docker 
sudo yum install unzip -y
sudo yum install awscli -y