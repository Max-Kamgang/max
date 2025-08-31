resource "aws_s3_bucket" "mybuckmax" {
    bucket = "weekutrainsbuck"
    tags = {
      Team = "dev"
      Environment = "Local"
    }
  
}