resource "aws_sns_topic" "ses_callback" {
  provider = aws.useast1
  name = "ses-callback"
}

#resource "aws_sns_topic_subscription" "ses_callback" {
#  provider = aws.useast1
#  topic_arn = "${aws_ses_topic.ses_callback.arn}"
#  protocol  = "https"
#  endpoint  = "https://api.${var.domain}/notifications/email/ses"
#}