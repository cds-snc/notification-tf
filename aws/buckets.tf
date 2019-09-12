resource "aws_s3_bucket" "asset_bucket" {
  bucket = "${var.name}-asset-upload"
  acl    = "private"
}

resource "aws_s3_bucket" "csv_bucket" {
  bucket = "${var.name}-csv-upload"
  acl    = "private"
}

resource "aws_s3_bucket" "document_bucket" {
  bucket = "${var.name}-document-download"
  acl    = "private"
}