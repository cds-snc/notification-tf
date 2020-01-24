resource "aws_cloudwatch_metric_alarm" "backend-5xx-warning" {
  alarm_name          = "${var.name}-backend-5xx-warning"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HTTPCode_Backend_5XX"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "0"
  treat_missing_data  = "notBreaching"

  alarm_actions = [
    aws_sns_topic.alert_warning.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "backend-5xx-critical" {
  alarm_name          = "${var.name}-backend-5xx-critical"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "HTTPCode_Backend_5XX"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "25"
  datapoints_to_alarm = 2
  treat_missing_data  = "notBreaching"

  alarm_actions = [
    aws_sns_topic.alert_critical.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "unhealthy-host-count-warning" {
  alarm_name          = "${var.name}-unhealthy-host-count-warning"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "UnHealthyHostCount"
  treat_missing_data  = "notBreaching"

  namespace = "AWS/ApplicationELB"
  period    = "60"
  statistic = "Maximum"
  threshold = "0"

  alarm_actions = [
    aws_sns_topic.alert_warning.arn,
  ]

  ok_actions = [
    aws_sns_topic.alert_warning.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "healthy-host-count-critical" {
  alarm_name          = "${var.name}-healthy-host-count-critical"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "HealthyHostCount"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1"

  alarm_actions = [
    aws_sns_topic.alert_critical.arn,
  ]

  ok_actions = [
    aws_sns_topic.alert_critical.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "latency-warning" {
  alarm_name          = "${var.name}-latency-warning"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "Latency"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "2.0"

  alarm_actions = [
    aws_sns_topic.alert_warning.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "latency-critical" {
  alarm_name          = "${var.name}-latency-critical"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "5"
  metric_name         = "Latency"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Average"
  threshold           = "5.0"
  datapoints_to_alarm = 2

  alarm_actions = [
    aws_sns_topic.alert_critical.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "backend-connection-errors-critical" {
  alarm_name          = "${var.name}-backend-connection-errors-critical"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "BackendConnectionErrors"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "10"
  datapoints_to_alarm = 2

  alarm_actions = [
    aws_sns_topic.alert_warning.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "surge-queue-length-warning" {
  alarm_name          = "${var.name}-surge-queue-length-warning"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "SurgeQueueLength"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "10"

  alarm_actions = [
    aws_sns_topic.alert_warning.arn,
  ]
}

resource "aws_cloudwatch_metric_alarm" "spillover-count-critical" {
  alarm_name          = "${var.name}-spillover-count-critical"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "SpilloverCount"
  treat_missing_data  = "notBreaching"
  namespace           = "AWS/ApplicationELB"
  period              = "60"
  statistic           = "Sum"
  threshold           = "0"

  alarm_actions = [
    aws_sns_topic.alert_critical.arn,
  ]
}
