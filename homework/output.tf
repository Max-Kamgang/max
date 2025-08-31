output "public_ip" {
  value = aws_lightsail_instance.max_aws.public_ip_address
}
output "private_ip" {
  value = aws_lightsail_instance.max_aws.private_ip_address
}
output "username" {
  value = aws_lightsail_instance.max_aws.username
}