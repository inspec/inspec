#============================================================#
#                      Security Groups
#============================================================#

# Look up the default VPC and the default security group for it
data "aws_vpc" "default" {
  default = "true"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name = "default"
}

output "ec2_security_group_default_vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "ec2_security_group_default_group_id" {
  value = "${data.aws_security_group.default.id}"
}