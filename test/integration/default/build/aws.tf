terraform {
  required_version = "~> 0.10.0"
}

provider "aws" {}

data "aws_caller_identity" "creds" {}
output "aws_account_id" {
  value = "${data.aws_caller_identity.creds.account_id}"
}