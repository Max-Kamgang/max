terraform {
  backend "s3" {
    key          = "utc-web/Tams/Dev/DevOps/terraform.tfstate"
    region       = "us-east-1"
    bucket       = "w7-mk-utc"
    use_lockfile = false
  }
}