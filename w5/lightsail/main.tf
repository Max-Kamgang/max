resource "aws_lightsail_instance" "lig" {
  name              = "DevoMax"
  availability_zone = "us-east-1a"

  blueprint_id = "amazon_linux_2"
  bundle_id    = "nano_3_0"
  key_pair_name = "w3key"
  
  tags = {
    env  = "dev"
    Team = "Devops"
    yo  = "mes fans"
  }

}
