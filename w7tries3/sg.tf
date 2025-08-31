
resource "aws_security_group" "mysg" {
  name        = "example-security-group"
  description = "Example security group"
  vpc_id      = aws_vpc.My_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/24"] # Allow SSH from a specific subnet
  }

  tags = {
    Name = "Max_secure"
  }
}