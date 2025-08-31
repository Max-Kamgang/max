resource "aws_vpc" "My_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "terraform-vpc"
    environment = "dev"
  }
}
// Internet Gateway
resource "aws_internet_gateway" "My_igw" {
    vpc_id = aws_vpc.My_vpc.id

    tags = {
      Name = "Max_gateway"
    }

}

// Subnet Creation
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.My_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Terraform-public-sub1"
  }
}
resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.My_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Terraform-public-sub2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.My_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Terraform-private1-sub1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.My_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Terraform-private-sub2"
  }
}
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Example security group"
  vpc_id = aws_vpc.My_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/24"]  # Allow SSH from a specific subnet
  }

  tags = {
    Name = "Max_secure"
  }
  }