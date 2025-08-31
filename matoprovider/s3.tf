resource "aws_s3_bucket" "mato-buck" {
  bucket = "mato-buck-provider"

  tags = {
    Name      = "MatoBucket"
    createdBy = "Max K"
  }
}