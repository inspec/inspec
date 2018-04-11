terraform {
  required_version = "~> 0.11.0"
}

provider "aws" {
  version = "~> 1.1"
}

data "aws_caller_identity" "creds" {}

output "aws_account_id" {
  value = "${data.aws_caller_identity.creds.account_id}"
}

data "aws_region" "region" {
  current = true
}

output "aws_region" {
  value = "${data.aws_region.region.name}"
}
