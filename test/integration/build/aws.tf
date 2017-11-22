terraform {
  required_version = "~> 0.10.0"
}

provider "aws" {}

resource "aws_iam_role" "example" {
  name = "${terraform.env}.example"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "example" {
  name  = "${terraform.env}.example"
  role = "${aws_iam_role.example.name}"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.example.name}"

  tags {
    Name = "${terraform.env}.Example"
    X-Project = "inspec"
  }
}

resource "aws_instance" "no_roles_instance" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"

  tags {
    Name = "${terraform.env}.NoRoles"
    X-Project = "inspec"
  }
}

resource "aws_iam_user" "mfa_not_enabled_user" {
    name = "${terraform.env}.mfa_not_enabled_user"
}

resource "aws_iam_user" "console_password_enabled_user" {
    name = "${terraform.env}.console_password_enabled_user"
    force_destroy = true
}

resource "aws_iam_user_login_profile" "user_login_profile" {
  user = "${aws_iam_user.console_password_enabled_user.name}"
  pgp_key = "${var.login_profile_pgp_key}"
}

resource "aws_iam_user" "access_key_user" {
  name = "${terraform.env}.access_key_user"
}

resource "aws_iam_access_key" "access_key" {
  user = "${aws_iam_user.access_key_user.name}"
  pgp_key = "${var.login_profile_pgp_key}"
}

resource "aws_cloudwatch_log_group" "lmf_lg_1" {
  name = "${terraform.env}_lmf_lg_1"
}

# We make a separate log group to test uniqueness of LMF identifiers
resource "aws_cloudwatch_log_group" "lmf_lg_2" {
  name = "${terraform.env}_lmf_lg_2"
}

resource "aws_cloudwatch_log_metric_filter" "lmf_1" {
  name           = "${terraform.env}_lmf"
  pattern        = "testpattern01"
  log_group_name = "${aws_cloudwatch_log_group.lmf_lg_1.name}"

  metric_transformation {
    name      = "${terraform.env}_KittehCount_1"
    namespace = "${terraform.env}_YourNamespace_1"
    value     = "1"
  }
}

resource "aws_cloudwatch_log_metric_filter" "lmf_2" {
  name           = "${terraform.env}_lmf"
  pattern        = "testpattern02"
  log_group_name = "${aws_cloudwatch_log_group.lmf_lg_2.name}"

  metric_transformation {
    name      = "${terraform.env}_KittehCount_3"
    namespace = "${terraform.env}_YourNamespace_3"
    value     = "1"
  }
}

output "lmf_1_name" {
  value = "${aws_cloudwatch_log_metric_filter.lmf_1.name}"
}

output "lmf_2_name" {
  value = "${aws_cloudwatch_log_metric_filter.lmf_2.name}"
}

output "lmf_1_metric_1_name" {
  value = "${terraform.env}_KittehCount_1"
}

output "lmf_lg_1_name" {
  value = "${aws_cloudwatch_log_group.lmf_lg_1.name}"
}

output "lmf_lg_2_name" {
  value = "${aws_cloudwatch_log_group.lmf_lg_2.name}"
}

output "mfa_not_enabled_user" {
  value = "${aws_iam_user.mfa_not_enabled_user.name}"
}

output "console_password_enabled_user" {
  value = "${aws_iam_user.console_password_enabled_user.name}"
}

output "access_key_user" {
  value = "${aws_iam_user.access_key_user.name}"
}

output "example_ec2_name" {
  value = "${aws_instance.example.tags.Name}"
}

output "example_ec2_id" {
  value = "${aws_instance.example.id}"
}

output "no_roles_ec2_id" {
  value = "${aws_instance.no_roles_instance.id}"
}


#===========================================================================#
#                                   SNS
#===========================================================================#

# Test fixture: 
# sns_test_topic_01 has one confirmed subscription
# sns_test_topic_02 has no subscriptions

resource "aws_sns_topic" "sns_test_topic_01" {
  name = "${terraform.env}-test-topic-01"
}

output "sns_test_topic_01_arn" {
  value = "${aws_sns_topic.sns_test_topic_01.arn}"
}

resource "aws_sqs_queue" "sqs_test_queue_01" {
  name = "${terraform.env}-test-queue-01"
}

resource "aws_sns_topic_subscription" "sqs_test_queue_01_sub" {
  topic_arn = "${aws_sns_topic.sns_test_topic_01.arn}"
  protocol  = "sqs"
  endpoint  = "${aws_sqs_queue.sqs_test_queue_01.arn}"
}

resource "aws_sns_topic" "sns_test_topic_02" {
  name = "${terraform.env}-test-topic-02"
}

output "sns_test_topic_02_arn" {
  value = "${aws_sns_topic.sns_test_topic_02.arn}"
}