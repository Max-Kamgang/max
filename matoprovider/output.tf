output "ipadress" {
  value = aws_instance.mato_instance.public_ip
}
output "keypairname" {
  value = aws_key_pair.mato_key.key_name
}