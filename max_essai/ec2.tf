// Code for an Ec2 instance
resource "aws_instance" "mato_instance" {
  ami                    = "ami-045269a1f5c90a6a0"
  availability_zone      = "us-east-1a"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.mato-pubsub1.id
  vpc_security_group_ids = [ aws_security_group.mato-sg.id ]
  key_name               = aws_key_pair.mato_key.key_name

  user_data = file("packages.sh")
  tags = {
    Name      = "server1_mato"
    createdBy = "Max K"
    env       = "dev"
  }
}