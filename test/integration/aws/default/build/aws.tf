terraform {
  required_version = "~> 0.11.0"
}

provider "aws" {
  # was 1.13.0
  version = "= 1.42.0"
}

data "aws_caller_identity" "creds" {}

output "aws_account_id" {
  value = "${data.aws_caller_identity.creds.account_id}"
}

data "aws_region" "current" {}

output "aws_region" {
  value = "${data.aws_region.current.name}"
}

data "aws_availability_zones" "available" {}