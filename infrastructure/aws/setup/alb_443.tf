
resource "aws_alb_listener" "notification-canada-ca_443" {
  load_balancer_arn = aws_alb.notification-canada-ca.id
  port              = 443
  protocol          = "HTTPS"
  certificate_arn = aws_acm_certificate.notification-canada-ca.arn
  default_action {
    target_group_arn = aws_alb_target_group.notification-canada-ca_80.id
    type             = "forward"
  }
}

resource "aws_alb_listener_certificate" "wildcard-notification-canada-ca" {
  listener_arn    = aws_alb_listener.notification-canada-ca_443.arn
  certificate_arn = aws_acm_certificate.wildcard-notification-canada-ca.arn
}