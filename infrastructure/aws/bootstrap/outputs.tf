output "bucket" {
  value = format("\"%s\"", aws_s3_bucket.storage_bucket.id)
}

output "key" {
  value = format("\"%s\"", "terraform.tfstate")
}

output "region" {
  value = format("\"%s\"", "us-east-1")
}

output "shared_credentials_file" {
  value = format("\"%s\"", "credentials")
}