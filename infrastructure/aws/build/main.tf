provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}
