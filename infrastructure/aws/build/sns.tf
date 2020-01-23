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

#resource "aws_sns_topic_subscription" "ses_callback" {
#  provider = aws.useast1
#  topic_arn = "${aws_sns_topic.ses_callback.arn}"
#  protocol  = "https"
#  endpoint  = "https://api.${var.domain}/notifications/email/ses"
#}