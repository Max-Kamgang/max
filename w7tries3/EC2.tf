// EC2 instance Code
resource "aws_instance" "server" {
  ami                    = "ami-045269a1f5c90a6a0"
  instance_type          = "t3.micro"
  availability_zone      = "us-east-1a"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name               = aws_key_pair.max_keypair.key_name
  user_data              = file("setup.sh")
  tags = {
    Name       = "terraform-ec2-instance"
    env        = "dev"
    created_by = "Max K"

  }

}

// Ebs Volume Attachment to the instance
resource "aws_ebs_volume" "ebsvol1" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20
  tags = {
    Name = "Extra-vol"
  }
}
resource "aws_volume_attachment" "volattach1" {
  instance_id = aws_instance.server.id
  volume_id   = aws_ebs_volume.ebsvol1.id
  device_name = "/dev/sdb"


}