#======================================================#
#                 Configuration Recorder
#======================================================#

resource "aws_config_configuration_recorder" "config_recorder" {
  name     = "config_recorder"
  role_arn = "${aws_iam_role.role_for_config_recorder.arn}"
}

resource "aws_iam_role" "role_for_config_recorder" {
  name = "role_for_config_recorder"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

output "role_for_config_recorder_arn" {
  value = "${aws_iam_role.role_for_config_recorder.arn}"
}

output "config_recorder_name" {
  value = "${aws_config_configuration_recorder.config_recorder.name}"
}

#======================================================#
#             Configuration Delivery Channel
#======================================================#

# Note that since AWS accounts can only have one Config Recorder,
# we have to re-use it here (as well as its role).

resource "aws_config_delivery_channel" "delivery_channel_01" {
  name           = "delivery_channel_01"
  s3_bucket_name = "${aws_s3_bucket.bucket_for_delivery_channel.bucket}"
  depends_on     = ["aws_config_configuration_recorder.config_recorder"]
  sns_topic_arn  = "${aws_sns_topic.sns_topic_for_delivery_channel.arn}"

  snapshot_delivery_properties = {
    delivery_frequency = "TwentyFour_Hours"
  }
}

output "delivery_channel_01_name" {
  value = "${aws_config_delivery_channel.delivery_channel_01.id}"
}

output "config_recorder_for_delivery_channel_role_arn" {
  value = "${aws_iam_role.role_for_config_recorder.arn}"
}

#======================================================#
#                    IAM Roles
#======================================================#

resource "aws_iam_role_policy" "policy_for_delivery_channel" {
  name = "policy_for_delivery_channel"
  role = "${aws_iam_role.role_for_config_recorder.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.bucket_for_delivery_channel.arn}",
        "${aws_s3_bucket.bucket_for_delivery_channel.arn}/*"
      ]
    }
  ]
}
POLICY
}

#=================================================================#
#                      Config S3 Buckets
#=================================================================#
resource "aws_s3_bucket" "bucket_for_delivery_channel" {
  bucket        = "inspec-bucket-for-delivery-channel-${terraform.env}.chef.io"
  acl           = "public-read"
  force_destroy = true
}

output "s3_bucket_for_delivery_channel_name" {
  value = "${aws_s3_bucket.bucket_for_delivery_channel.id}"
}

#===========================================================================#
#                                 SNS Topic
#===========================================================================#
resource "aws_sns_topic" "sns_topic_for_delivery_channel" {
  name = "${terraform.env}-sns_topic_for_delivery_channel"
}

output "sns_topic_for_delivery_channel_arn" {
  value = "${aws_sns_topic.sns_topic_for_delivery_channel.arn}"
}
