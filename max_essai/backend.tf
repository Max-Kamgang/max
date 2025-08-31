terraform {
  backend "s3" {
    bucket = "mato-buck-provider"
    key = "Mato/Teams/Dev/DevOps/terraform.tfstate"
    region = "us-east-1"
    
  }
}