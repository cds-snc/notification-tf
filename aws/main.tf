provider "aws" {
  version = "~> 2.0"
  region  = "ca-central-1"
  shared_credentials_file = "credentials"
}

terraform {
  backend "s3" {}
}
