resource "aws_ecr_repository" "api_repository" {
  name = "${var.name}/api"
}

resource "aws_ecr_repository" "admin_repository" {
  name = "${var.name}/admin"
}

resource "aws_ecr_repository" "document_api_repository" {
  name = "${var.name}/document-download-api"
}

resource "aws_ecr_repository" "document_frontend_repository" {
  name = "${var.name}/document-download-frontend"
}