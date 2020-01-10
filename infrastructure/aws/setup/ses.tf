resource "aws_ses_domain_identity" "ses_domain" {
  domain = "${var.domain}"
}

resource "aws_ses_configuration_set" "ses_configuration_set" {
  name = "ses-configuration-set"
}

resource "aws_ses_event_destination" "sns" {
  name                   = "event-destination-sns"
  configuration_set_name = "${aws_ses_configuration_set.ses_configuration_set.name}"
  enabled                = true
  matching_types         = ["send", "reject", "bounce", "complaint", "delivery", "open", "click", "renderingFailure"]

  sns_destination {
    topic_arn = "${aws_sns_topic.ses_callback.arn}"
  }
}