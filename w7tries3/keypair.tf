// Creation of Key Pair
resource "tls_private_key" "max_Key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "max_keypair" {
  key_name   = "max-key"
  public_key = tls_private_key.max_Key.public_key_openssh
}
// Save the private key to a file
resource "local_file" "private_key_pem" {
  content         = tls_private_key.max_Key.private_key_pem
  filename        = "maxkey.pem"
  file_permission = 0400
}

