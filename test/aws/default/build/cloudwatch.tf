# Contains resources and outputs related to testing the aws_cloudwatch_* resources.

#======================================================#
#                    Log Metric Filters
#======================================================#

#----------------------- Recall -----------------------#

# Fixture notes:
# LMF 1 recalled by filter name and log group
# LMF 2 recalled by pattern

resource "aws_cloudwatch_log_metric_filter" "lmf_1" {
  name           = "${terraform.env}_lmf"
  pattern        = "testpattern01"
  log_group_name = "${aws_cloudwatch_log_group.lmf_lg_1.name}"

  metric_transformation {
    name      = "${terraform.env}_testmetric_1"
    namespace = "${terraform.env}_YourNamespace_1"
    value     = "1"
  }
}

output "log_metric_filter_1_name" {
  value = "${aws_cloudwatch_log_metric_filter.lmf_1.name}"
}

resource "aws_cloudwatch_log_group" "lmf_lg_1" {
  name = "${terraform.env}_lmf_lg_1"
}

output "log_metric_filter_1_log_group_name" {
  value = "${aws_cloudwatch_log_group.lmf_lg_1.name}"
}

output "log_metric_filter_1_metric_name" {
  value = "${terraform.env}_testmetric_1"
}

resource "aws_cloudwatch_log_metric_filter" "lmf_2" {
  name           = "${terraform.env}_lmf"
  pattern        = "${terraform.env}testpattern02"
  log_group_name = "${aws_cloudwatch_log_group.lmf_lg_2.name}"

  metric_transformation {
    name      = "${terraform.env}_testmetric_3"
    namespace = "${terraform.env}_YourNamespace_3"
    value     = "1"
  }
}

output "log_metric_filter_2_name" {
  value = "${aws_cloudwatch_log_metric_filter.lmf_2.name}"
}

resource "aws_cloudwatch_log_group" "lmf_lg_2" {
  name = "${terraform.env}_lmf_lg_2"
}

output "log_metric_filter_2_log_group_name" {
  value = "${aws_cloudwatch_log_group.lmf_lg_2.name}"
}

output "log_metric_filter_2_pattern" {
  value = "${terraform.env}testpattern02"
}
#======================================================#
#                   Cloudwatch Alarms
#======================================================#

resource "aws_cloudwatch_metric_alarm" "alarm_1" {
  alarm_name                = "${terraform.env}-test-alarm-01"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "${terraform.env}_testmetric_1"
  namespace                 = "${terraform.env}_YourNamespace_1"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric is a test metric"
  insufficient_data_actions = []
}

output "cloudwatch_alarm_1_name" {
  value = "${terraform.env}-test-alarm-01"
}

output "cloudwatch_alarm_1_namespace" {
  value = "${terraform.env}_YourNamespace_1"
}

output "cloudwatch_alarm_1_metric_name" {
  value = "${terraform.env}_testmetric_1"
}