// Creating a vpc...........
resource "aws_vpc" "kmax_vpc" {
  cidr_block = "10.0.0.0/16"
}
// Subnet for public Ip adresses
resource "aws_subnet" "max_sub1" {
  vpc_id            = aws_vpc.kmax_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet1"

  }
}

resource "aws_subnet" "max_sub2" {
  vpc_id            = aws_vpc.kmax_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-subnet2"

  }
}
// Subnet for private Ip adresses
resource "aws_subnet" "max_psub3" {
  vpc_id            = aws_vpc.kmax_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet1"

  }
}

resource "aws_subnet" "max_psub4" {
  vpc_id            = aws_vpc.kmax_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet2"

  }
}
//code
// Code for Lightsail Instances
resource "aws_lightsail_instance" "max_aws" {
  availability_zone = "us-east-1a"
  blueprint_id = "ubuntu_22_04"
key_pair_name = "w3key"
  bundle_id         = "medium_1_0"
  name              = "dev_server"
  user_data         = <<-EOF
  #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable 
    sudo useradd max 
    
    echo '<h1>This is deployed by YourName</h1>' | sudo tee /var/www/html/index.html
EOF
}
// Code for Creation of a Security Group
resource "aws_security_group" "kmax" {
  name        = "kmax_security_group"
  description = "Security group for kmax@group resources"
  vpc_id      =  aws_vpc.kmax_vpc.id
  
  ingress {
    from_port   = 80                   
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]         
  }

  ingress {
    from_port   = 22                    
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]         
  }
  ingress {
    from_port   = 443                    
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]         
  }
  ingress {
    from_port   = 8080                  
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]         
  }

  

  tags = {
    Name = "example-security-group"
  }
}