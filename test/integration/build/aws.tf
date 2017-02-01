provider "aws" {}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"

  tags {
    Name = "Example"
    X-Project = "inspec"
  }
}

resource "aws_iam_user" "mfa_not_enabled_user" {
    name = "mfa_not_enabled_user"
}

resource "aws_iam_user" "console_password_enabled_user" {
    name = "console_password_enabled_user"
    force_destroy = true
}

resource "aws_iam_user_login_profile" "u" {
        user = "${aws_iam_user.console_password_enabled_user.name}"
        pgp_key = "${var.login_profile_pgp_key}"
}