// code for Volume and his attachments

resource "aws_ebs_volume" "ebs_mato1" {
  availability_zone = aws_instance.mato_instance.availability_zone
  size              = "200"
  tags = {
    Name = "extra-volumev1"
  }
}
resource "aws_volume_attachment" "ebsattach1" {
  volume_id   = aws_ebs_volume.ebs_mato1.id
  instance_id = aws_instance.mato_instance.id
  device_name = "/dev/sdb"

}