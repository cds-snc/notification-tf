resource "aws_sns_topic" "ses_callback" {
  provider = aws.useast1
  name = "ses-callback"
}

resource "aws_sns_topic" "alert_warning" {
  name = "alert-warning"
}

resource "aws_sns_topic" "alert_critical" {
  name = "alert-critical"
}