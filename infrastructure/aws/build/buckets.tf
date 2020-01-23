resource "aws_s3_bucket" "asset_bucket" {
  bucket = "${var.name}-production-asset-upload"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "csv_bucket" {
  bucket = "${var.name}-production-csv-upload"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "document_bucket" {
  bucket = "${var.name}-production-document-download"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "alb_log_bucket" {
  bucket = "${var.name}-log-bucket"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

data "aws_elb_service_account" "main" {}

resource "aws_s3_bucket_policy" "notification" {
  bucket = aws_s3_bucket.alb_log_bucket.id

  policy = <<POLICY
{
  "Id": "notificationALBWrite",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "notificationALBWrite",
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${var.name}-log-bucket/alb/*",
      "Principal": {
        "AWS": [
          "${data.aws_elb_service_account.main.arn}"
        ]
      }
    }
  ]
}
POLICY
}