// Private, isolated and secure Network use in a cloud infrastructure to launch our resources 
resource "aws_vpc" "mato_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name       = "mato_vpc"
    env        = "dev"
    created_by = "max k"
  }
}

// Cloud Tool to allow communication between our VPC and Internet
resource "aws_internet_gateway" "mato-igtw" {
  vpc_id = aws_vpc.mato_vpc.id

  tags = {
    Name = "mato-igtw"
    env  = "dev"

  }
}
// Static ip Adress 
resource "aws_eip" "mato_elastic_ip" {
  tags = {
    Name = "mato_eip"
  }
}
// Cloud Tool that allow the communication the private subnets and Internet => NAT Gateways

resource "aws_nat_gateway" "mato_nat_gw" {
  allocation_id = aws_eip.mato_elastic_ip.id
  subnet_id     = aws_subnet.mato-pubsub1.id
  tags = {
    Name = "mato-NAT"
  }
}
// Subnets that have route to Internet via the Internet Gateway
resource "aws_subnet" "mato-pubsub1" {
  vpc_id            = aws_vpc.mato_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "192.168.1.0/24"
  tags = {
    Name       = "mato-pubsub1"
    env        = "dev"
    created_by = "max k"
  }
}
resource "aws_subnet" "mato-pubsub2" {
  vpc_id            = aws_vpc.mato_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "mato-pubsub2"
    env  = "dev"
  }
}

// Subnets with no route to internet and use to have access to databases and servers
resource "aws_subnet" "mato_priv_sub1" {
  cidr_block        = "192.168.3.0/24"
  vpc_id            = aws_vpc.mato_vpc.id
  availability_zone = "us-east-1a"

}
resource "aws_subnet" "mato_priv_sub2" {
  cidr_block        = "192.168.4.0/24"
  vpc_id            = aws_vpc.mato_vpc.id
  availability_zone = "us-east-1a"

}

// Cloud Tool to set Rules called Routes that will determine where the network traffic 
// will be directed
// For public
resource "aws_route_table" "mato_pub_route" {
  vpc_id = aws_vpc.mato_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mato-igtw.id
  }
  tags = {
    Name = "Mato_pub_route"
  }
}
// For Private 
resource "aws_route_table" "mato_route_private" {
  vpc_id = aws_vpc.mato_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mato_nat_gw.id
  }
  tags = {
    Name = "Mato_private_route"
  }

}
// Code For the route Table Association
// Route table association for public Subnets
resource "aws_route_table_association" "mato_rta1" {
  route_table_id = aws_route_table.mato_pub_route.id
  subnet_id      = aws_subnet.mato-pubsub1.id
}
resource "aws_route_table_association" "mato_rta2" {
  route_table_id = aws_route_table.mato_pub_route.id
  subnet_id      = aws_subnet.mato-pubsub2.id
}
// Route Table Association for Private Subnets
resource "aws_route_table_association" "mato-rtpr1" {
  route_table_id = aws_route_table.mato_route_private.id
  subnet_id      = aws_subnet.mato_priv_sub1.id
}
resource "aws_route_table_association" "mato-rtapr2" {
  route_table_id = aws_route_table.mato_route_private.id
  subnet_id      = aws_subnet.mato_priv_sub2.id
}