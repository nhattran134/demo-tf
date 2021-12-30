provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {}
}