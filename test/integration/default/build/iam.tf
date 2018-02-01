# Contains resources and outputs related to testing the aws_iam_* resources.

variable "login_profile_pgp_key" {
  type = "string"
  # You may override this using a tfvars file or other approaches.
  default = "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"
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
    name = "${terraform.env}.has_console_password"
    force_destroy = true
}

resource "aws_iam_user_login_profile" "login_profile_for_password_user" {
  user = "${aws_iam_user.has_console_password.name}"
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
  user = "${aws_iam_user.with_access_key.name}"
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