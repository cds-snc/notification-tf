resource "aws_kms_key" "deploy-key" {
  description             = "${var.name}-deploy-key"
  deletion_window_in_days = 7
}