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

# Create a security group with a known description 
# in the default VPC
resource "aws_security_group" "alpha" {
  name        = "alpha"
  description = "SG alpha"
  vpc_id      = "${data.aws_vpc.default.id}"
}

output "ec2_security_group_alpha_group_id" {
  value = "${aws_security_group.alpha.id}"
}
