resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id
}

# Internet to ALB
resource "aws_security_group" "notification-canada-ca_alb" {
  name        = "notification-canada-ca-alb"
  description = "Allow access on port 80,443 only to ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}