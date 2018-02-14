resource "aws_config_delivery_channel" "delivery_channel_01" {
  name           = "delivery_channel_01"
  s3_bucket_name = "${aws_s3_bucket.bucket_for_delivery_channel.bucket}"
  depends_on     = ["aws_config_configuration_recorder.config_recorder_for_delivery_channel"]
  sns_topic_arn  = "${aws_sns_topic.sns_topic_for_delivery_log.arn}"
  snapshot_delivery_properties = {
    delivery_frequency = "TwentyFour_Hours"
  }
}

resource "aws_config_configuration_recorder" "config_recorder_for_delivery_channel" {
  name     = "config_recorder_for_delivery_channel"
  role_arn = "${aws_iam_role.role_for_config_delivery_channel.arn}"
}

output "delivery_channel_01" {
  value = "${aws_config_delivery_channel.delivery_channel_01.id}"
}

output "config_recorder_for_delivery_channel_role_arn" {
  value = "${aws_iam_role.role_for_config_delivery_channel.arn}"
}

output "delivery_channel_01_bucket_prefix" {
  value = "${aws_config_delivery_channel.delivery_channel_01.s3s3_key_prefix}"
}