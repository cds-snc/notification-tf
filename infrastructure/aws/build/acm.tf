resource "aws_acm_certificate" "notification-canada-ca" {
  domain_name       =  var.domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_acm_certificate" "wildcard-notification-canada-ca" {
  domain_name       =  "*.${var.domain}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
