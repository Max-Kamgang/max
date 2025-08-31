output "id_vpc" {
  value = aws_vpc.My_vpc.id
}
output "Name_vpc" {
  value = aws_vpc.My_vpc.tags
}
output "public_id" {
    value = aws_subnet.public1.id
  
}
output "public2_id" {
  value = aws_subnet.public2.id
}

