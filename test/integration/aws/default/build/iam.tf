# Contains resources and outputs related to testing the aws_iam_* resources.

variable "login_profile_pgp_key" {
  type = "string"

  # You may override this using a tfvars file or other approaches.
  default = "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"
}

#======================================================#
#               Accoount Password Policy
#======================================================#
# Only one of these is allowed
resource "aws_iam_account_password_policy" "fixture" {
  minimum_password_length        = 10
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 365
  password_reuse_prevention      = 7
}

#======================================================#
#                    IAM Users
#======================================================#

#----------------------- Recall -----------------------#
resource "aws_iam_user" "recall_hit" {
  name = "${terraform.env}.recall_hit"
}

output "iam_user_recall_hit" {
  value = "${aws_iam_user.recall_hit.name}"
}

output "iam_user_recall_miss" {
  value = "${terraform.env}.recall_miss"
}

#---------- Property - has_console_password -----------#

# TODO: test for no console password user

resource "aws_iam_user" "has_console_password" {
  name          = "${terraform.env}.has_console_password"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "login_profile_for_password_user" {
  user    = "${aws_iam_user.has_console_password.name}"
  pgp_key = "${var.login_profile_pgp_key}"
}

output "iam_user_has_console_password" {
  value = "${aws_iam_user.has_console_password.name}"
}

#------------- Property - has_mfa_enabled -------------#

# TODO: manual fixture for positive test of mfa_enabled
# TODO: tests and fixtures for hardware mfa

resource "aws_iam_user" "no_mfa_enabled" {
  name = "${terraform.env}.no_mfa_enabled"
}

output "iam_user_no_mfa_enabled" {
  value = "${aws_iam_user.no_mfa_enabled.name}"
}

#------------- Property - access_keys -------------#

resource "aws_iam_user" "with_access_key" {
  name = "${terraform.env}.with_access_key"
}

resource "aws_iam_access_key" "access_key_for_user" {
  user    = "${aws_iam_user.with_access_key.name}"
  pgp_key = "${var.login_profile_pgp_key}"
}

output "iam_user_with_access_key" {
  value = "${aws_iam_user.with_access_key.name}"
}

resource "aws_iam_user" "without_access_key" {
  name = "${terraform.env}.without_access_key"
}

output "iam_user_without_access_key" {
  value = "${aws_iam_user.without_access_key.name}"
}

#======================================================#
#                    IAM Access Keys
#======================================================#

output "iam_access_key_recall_hit" {
  value = "${aws_iam_access_key.access_key_for_user.id}"
}

output "iam_access_key_recall_miss" {
  value = "AKIAFAKEFAKEFAKEFAKE"
}

#======================================================#
#                    IAM Groups
#======================================================#

resource "aws_iam_group" "administrators" {
  name = "${terraform.env}.administrators"
}

output "iam_group_administrators" {
  value = "${aws_iam_group.administrators.name}"
}

#======================================================#
#                  IAM Policies
#======================================================#

# Test fixtures:
# Note: Principal is not allowed on an IAM Policy. (May be allowed on a role?  certainly on s3 bucket?)
#  alpha
#    has 2 statements
#    one is a wildcard on ec2
#    both have IDs
#    one is a resource full wildcard
#    one is Allow, one is Deny
#    scalar values throughout
#  beta
#    one statement
#    list values for Resource and Action
#  gamma
#    allow all

resource "aws_iam_policy" "alpha" {
  name = "${terraform.env}-alpha"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "alpha01",
      "Action": "ec2:Describe*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "alpha02",
      "Action": "s3:GetObject",
      "Effect": "Deny",
      "Resource": "arn:aws:s3:::bobs-stuff"
    }
  ]
}
EOF
}

output "aws_iam_policy_alpha_name" {
  value = "${aws_iam_policy.alpha.name}"
}

resource "aws_iam_policy" "beta" {
  name = "${terraform.env}-beta"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "beta01",
      "Action": [
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups"
      ],
      "Effect": "Deny",
      "Resource": [
        "arn:aws:ec2:::*",
        "*"
      ]
    }
  ]
}
EOF
}

output "aws_iam_policy_beta_name" {
  value = "${aws_iam_policy.beta.name}"
}

resource "aws_iam_policy" "gamma" {
  name = "${terraform.env}-gamma"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "gamma01",
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "aws_iam_policy_gamma_name" {
  value = "${aws_iam_policy.gamma.name}"
}
#======================================================#
#                    IAM Group Memberships
#======================================================#

resource "aws_iam_group_membership" "administrators_membership" {
  name = "administrators_membership"

  users = [
    "${aws_iam_user.recall_hit.name}",
  ]

  group = "${aws_iam_group.administrators.name}"
}

#======================================================#
#           User Policies - Attached and Inline
#======================================================#

# Naming scheme: 1i_1a means one 
# inline policy, one attached policy, etc

#------------------------------------------#
# A user with neither attached nor inline
#------------------------------------------#
output "iam_user_for_policies_0i_0a_name" {
  value = "${aws_iam_user.recall_hit.name}"
}

#------------------------------------------#
# A user with one inline and no attached
#------------------------------------------#

resource "aws_iam_user" "for_policies_1i_0a" {
  name = "${terraform.env}_user_for_policies_1i_0a"
}

resource "aws_iam_user_policy" "test_1i_0a" {
  name = "test_1i_0a_1"
  user = "${aws_iam_user.for_policies_1i_0a.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "ec2:Describe*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

output "iam_user_for_policies_1i_0a_name" {
  value = "${aws_iam_user.for_policies_1i_0a.name}"
}

#------------------------------------------#
# A user with two inlines and no attached
#------------------------------------------#

resource "aws_iam_user" "for_policies_2i_0a" {
  name = "${terraform.env}_user_for_policies_2i_0a"
}

resource "aws_iam_user_policy" "test_2i_0a_1" {
  name = "test_2i_0a_1"
  user = "${aws_iam_user.for_policies_2i_0a.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "s3:List*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

resource "aws_iam_user_policy" "test_2i_0a_2" {
  name = "test_2i_0a_2"
  user = "${aws_iam_user.for_policies_2i_0a.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "rds:Describe*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

output "iam_user_for_policies_2i_0a_name" {
  value = "${aws_iam_user.for_policies_2i_0a.name}"
}

#------------------------------------------#
# A user with one inline and one attached
#------------------------------------------#

resource "aws_iam_user" "for_policies_1i_1a" {
  name = "${terraform.env}_user_for_policies_1i_1a"
}

resource "aws_iam_user_policy" "test_1i_1a" {
  name = "test_1i_1a_1"
  user = "${aws_iam_user.for_policies_1i_1a.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "sns:Describe*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

resource "aws_iam_policy" "user_attached_1i_1a_1" {
  name = "${terraform.env}_user_attached_1i_1a_1"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "ec2:Describe*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "attch_1i_1a_1" {
  user       = "${aws_iam_user.for_policies_1i_1a.name}"
  policy_arn = "${aws_iam_policy.user_attached_1i_1a_1.arn}"
}

output "iam_policy_user_attached_1i_1a_1_arn" {
  value = "${aws_iam_policy.user_attached_1i_1a_1.arn}"
}

output "iam_policy_user_attached_1i_1a_1_name" {
  value = "${aws_iam_policy.user_attached_1i_1a_1.name}"
}

output "iam_user_for_policies_1i_1a_name" {
  value = "${aws_iam_user.for_policies_1i_1a.name}"
}

#------------------------------------------#
# A user with no inline and two attached
#------------------------------------------#

resource "aws_iam_user" "for_policies_0i_2a" {
  name = "${terraform.env}_user_for_policies_0i_2a"
}

# We'd like to test with an AWS-Managed policy, but 
# the old AWS TF plugin we're using doesn't support the data lookup.
# For now, hardcode until https://github.com/chef/inspec/issues/2884
# data "aws_iam_policy" "user_attached_0i_2a_1" {
#   arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
# }
variable "aws_iam_policy_user_attached_0i_2a_1_arn" {
  default = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

variable "aws_iam_policy_user_attached_0i_2a_1_name" {
  default = "ReadOnlyAccess"
}

resource "aws_iam_policy" "user_attached_0i_2a_2" {
  name = "${terraform.env}_user_attached_0i_2a_2"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    { "Action": "ec2:Describe*", "Effect": "Allow", "Resource": "*" } 
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "attch_0i_2a_1" {
  user       = "${aws_iam_user.for_policies_0i_2a.name}"
  policy_arn = "${var.aws_iam_policy_user_attached_0i_2a_1_arn}"
}

resource "aws_iam_user_policy_attachment" "attch_0i_2a_2" {
  user       = "${aws_iam_user.for_policies_0i_2a.name}"
  policy_arn = "${aws_iam_policy.user_attached_0i_2a_2.arn}"
}

output "iam_policy_user_attached_0i_2a_1_arn" {
  value = "${var.aws_iam_policy_user_attached_0i_2a_1_arn}"
}

output "iam_policy_user_attached_0i_2a_1_name" {
  value = "${var.aws_iam_policy_user_attached_0i_2a_1_name}"
}

output "iam_policy_user_attached_0i_2a_2_arn" {
  value = "${aws_iam_policy.user_attached_0i_2a_2.arn}"
}

output "iam_policy_user_attached_0i_2a_2_name" {
  value = "${aws_iam_policy.user_attached_0i_2a_2.name}"
}

output "iam_user_for_policies_0i_2a_name" {
  value = "${aws_iam_user.for_policies_0i_2a.name}"
}
