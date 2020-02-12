resource "aws_sns_topic_subscription" "ses_callback" {
  topic_arn = "${aws_ses_topic.ses_callback.arn}"
  protocol  = "https"
  endpoint  = "https://api.${var.domain}/notifications/email/ses"
}