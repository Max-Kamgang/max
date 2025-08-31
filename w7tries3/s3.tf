// Code for S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "utc-app-tk536"

  tags = {
    Name        = "utcbuckapp"
    Environment = "Dev"
  }
}