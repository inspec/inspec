variable "nodes_count" {
  description = "The total number of nodes"
  default = 1
}

variable "region" {
  description = "The region"
  default = "us-east-1"
}

variable "aws_profile" {
  description = "The AWS profile"
  default = "chef-engineering"
}