// Code for the key pair 
resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "aws_key_pair" "mato_key" {
  public_key = tls_private_key.tlskey.public_key_openssh
  key_name   = "mato_key"
}
resource "local_file" "private_key_pem" {
  filename        = "matokey.pem"
  content         = tls_private_key.tlskey.private_key_pem
  file_permission = 777
}