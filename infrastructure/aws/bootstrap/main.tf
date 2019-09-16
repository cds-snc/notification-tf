provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
  shared_credentials_file = "../credentials"
}

resource "aws_s3_bucket" "storage_bucket" {
  bucket = "${var.name}-tf-storage"
  acl    = "private"
}