// Firewall Configuration for EC2 Instances
resource "aws_security_group" "mato-sg" {
  vpc_id = aws_vpc.mato_vpc.id
  name   = "max-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow ip adress and http from anywhere
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow ssh with any ip adress v4
  }

  #Egress Code but we will not define it !


  tags = {
    Name      = "Mato-sg"
    env       = "dev"
    createdBy = "Max K"
  }
}