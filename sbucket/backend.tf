
terraform {
  backend "s3" {
    bucket = "weekutrainsbuck"
    key= "Geico/Teams/Dev/Devops/terraform.tfstate"
    region = "us-east-1"
    
  }
}
