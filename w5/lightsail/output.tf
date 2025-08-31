output "my-public-ip"{
    value = aws_lightsail_instance.lig.public_ip_address
  }

  output "my_username" {
    value = aws_lightsail_instance.lig.username

  }

  output "Keypaiir" {
    value = aws_lightsail_instance.lig.key_pair_name
  }