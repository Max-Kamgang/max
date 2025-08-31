output "Public_ip" {
  value = aws_instance.server.public_ip
}
output "instance_id" {
  value = aws_instance.server.id
}
output "key_pair_name" {
  value = aws_key_pair.max_keypair.key_name
}
