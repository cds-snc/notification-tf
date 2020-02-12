resource "aws_alb" "notification-canada-ca" {
  name            = "notification-canada-ca-alb"
  subnets         = module.vpc.public_subnets
  security_groups = [
    aws_security_group.notification-canada-ca_alb.id,
    data.aws_eks_cluster.cluster.vpc_config.0.cluster_security_group_id
  ]

  access_logs {
    bucket = aws_s3_bucket.alb_log_bucket.id
    prefix = "alb"
    enabled = true
  }
}

resource "aws_alb_target_group" "notification-canada-ca_80" {
  name        = "notification-canada-ca-alb-80"
  port        = 30080
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  health_check {
    path = "/"
    matcher = "200"
  }
}

resource "aws_alb_listener" "notification-canada-ca_80" {
  load_balancer_arn = aws_alb.notification-canada-ca.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.notification-canada-ca_80.id
    type             = "forward"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_alb_80" {
  autoscaling_group_name = module.eks.node_groups.production.resources[0].autoscaling_groups[0].name
  alb_target_group_arn   = aws_alb_target_group.notification-canada-ca_80.arn
}