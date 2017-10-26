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
