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