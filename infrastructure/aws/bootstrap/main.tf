provider "aws" {
  version = "~> 2.0"
  region  = "ca-central-1"
  shared_credentials_file = "../credentials"
}

resource "aws_s3_bucket" "storage_bucket" {
  bucket = "${var.name}-tf-storage"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}