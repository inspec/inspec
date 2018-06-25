resource "aws_s3_bucket" "trail_1_bucket" {
  bucket        = "${terraform.env}-trail-01-bucket"
  force_destroy = true

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${terraform.env}-trail-01-bucket"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${terraform.env}-trail-01-bucket/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

resource "aws_iam_role" "cloud_watch_logs_role" {
  name = "${terraform.env}-cloud-watch-logs-role"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
            "Service": "cloudtrail.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy" "cloud_watch_logs_role_policy" {
  depends_on = ["aws_iam_role.cloud_watch_logs_role"]

  name = "${terraform.env}-cloud-watch-logs-role-policy"
  role = "${terraform.env}-cloud-watch-logs-role"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailCreateLogStream",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream"
            ],
            "Resource": [
                "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.creds.account_id}:log-group:${aws_cloudwatch_log_group.trail_1_log_group.name}:log-stream:${data.aws_caller_identity.creds.account_id}_CloudTrail_${data.aws_region.current.name}*"
            ]
        },
        {
            "Sid": "AWSCloudTrailPutLogEvents",
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.creds.account_id}:log-group:${aws_cloudwatch_log_group.trail_1_log_group.name}:log-stream:${data.aws_caller_identity.creds.account_id}_CloudTrail_${data.aws_region.current.name}*"
            ]
        }
    ]
}
POLICY
}

resource "aws_cloudwatch_log_group" "trail_1_log_group" {
  name = "${terraform.env}-trail-01-log-group"
}

resource "aws_kms_key" "trail_1_key" {
  description             = "${terraform.env}-trail-01-key"
  deletion_window_in_days = 10

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Key policy created by CloudTrail",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.creds.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow CloudTrail to encrypt logs",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "kms:GenerateDataKey*",
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:${data.aws_caller_identity.creds.account_id}:trail/*"
        }
      }
    },
    {
      "Sid": "Allow CloudTrail to describe key",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Action": "kms:DescribeKey",
      "Resource": "*"
    },
    {
      "Sid": "Allow principals in the account to decrypt log files",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "kms:Decrypt",
        "kms:ReEncryptFrom"
      ],
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "kms:CallerAccount": "${data.aws_caller_identity.creds.account_id}"
        },
        "StringLike": {
          "kms:EncryptionContext:aws:cloudtrail:arn": "arn:aws:cloudtrail:*:${data.aws_caller_identity.creds.account_id}:trail/*"
        }
      }
    },
    {
      "Sid": "Allow alias creation during setup",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:CreateAlias",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "kms:ViaService": "ec2.${data.aws_region.current.name}.amazonaws.com",
          "kms:CallerAccount": "${data.aws_caller_identity.creds.account_id}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_cloudtrail" "trail_1" {
  depends_on                    = ["aws_iam_role_policy.cloud_watch_logs_role_policy"]
  name                          = "${terraform.env}-trail-01"
  s3_bucket_name                = "${aws_s3_bucket.trail_1_bucket.id}"
  include_global_service_events = true
  enable_logging                = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true

  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.trail_1_log_group.arn}"
  cloud_watch_logs_role_arn  = "${aws_iam_role.cloud_watch_logs_role.arn}"
  kms_key_id                 = "${aws_kms_key.trail_1_key.arn}"
}

resource "aws_cloudtrail" "trail_2" {
  name           = "${terraform.env}-trail-02"
  s3_bucket_name = "${aws_s3_bucket.trail_1_bucket.id}"
}

output "cloudtrail_trail_1_name" {
  value = "${aws_cloudtrail.trail_1.name}"
}

output "cloudtrail_trail_1_arn" {
  value = "${aws_cloudtrail.trail_1.arn}"
}

output "cloudtrail_trail_1_s3_bucket_name" {
  value = "${aws_s3_bucket.trail_1_bucket.id}"
}

output "cloudtrail_trail_1_key_arn" {
  value = "${aws_kms_key.trail_1_key.arn}"
}

output "cloudtrail_trail_1_cloud_watch_logs_group_arn" {
  value = "${aws_cloudwatch_log_group.trail_1_log_group.arn}"
}

output "cloudtrail_trail_1_cloud_watch_logs_role_arn" {
  value = "${aws_iam_role.cloud_watch_logs_role.arn}"
}

output "cloudtrail_trail_2_s3_bucket_name" {
  value = "${aws_s3_bucket.trail_1_bucket.id}"
}

output "cloudtrail_trail_2_name" {
  value = "${aws_cloudtrail.trail_2.name}"
}

output "cloudtrail_trail_2_arn" {
  value = "${aws_cloudtrail.trail_2.arn}"
}
