variable "aws_region" {
  default = "us-west-2"
}

variable "aws_profile" {
  default = "chef-engineering"
}

variable "key_name" {
  default = "inspec-db-test"
}

variable "project_name" {
  default = "inspec-mongodb-db-test"
}

variable "vpc-cidr" {
  default = "10.0.0.0/16"
  description = "VPC CIDR BLOCK"
  type = string
}

variable "ssh-location" {
default = "0.0.0.0/0"
description = "SSH variable for bastion host"
type = string
}

variable "Public_Subnet_1" {
default = "10.0.0.0/24"
description = "Public_Subnet_1"
type = string
}