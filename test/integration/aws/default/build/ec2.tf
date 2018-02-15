# Contains resources and outputs related to testing the aws_ec2_* resources.

#======================================================#
#                    EC2 Instances
#======================================================#

# Test fixture info:
# instance |    OS   | has_role? | instance_type
# -----------------------------------------------
#  alpha   | debian  |    N      |  t2.micro
#   beta   | centos  |    Y      |  t2.small


resource "aws_instance" "alpha" {
  ami           = "${data.aws_ami.debian.id}"
  instance_type = "t2.micro"

  tags {
    Name = "${terraform.env}.alpha"
    X-Project = "inspec"
  }
}

resource "aws_instance" "beta" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.small"
  iam_instance_profile = "${aws_iam_instance_profile.profile_for_ec2_with_role.name}"

  tags {
    Name = "${terraform.env}.beta"
    X-Project = "inspec"
  }
}

#----------------------- Recall -----------------------#

# Using Alpha for recall
output "ec2_instance_recall_hit_name" {
  value = "${aws_instance.alpha.tags.Name}"
}

output "ec2_instance_recall_hit_id" {
  value = "${aws_instance.alpha.id}"
}

output "ec2_instance_recall_miss" {
  value = "i-06b4bc106e0d03dfd"
}

#----------------- has_role property ------------------#

# No role
output "ec2_instance_no_role_id" {
  value = "${aws_instance.alpha.id}"
}

# Has a role
resource "aws_iam_role" "role_for_ec2_with_role" {
  name = "${terraform.env}.role_for_ec2_with_role"

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

resource "aws_iam_instance_profile" "profile_for_ec2_with_role" {
  name  = "${terraform.env}.profile_for_ec2_with_role"
  role = "${aws_iam_role.role_for_ec2_with_role.name}"
}

output "ec2_instance_has_role_id" {
  value = "${aws_instance.beta.id}"
}

#-------------------- instance_type property -----------------------#
output "ec2_instance_type_t2_micro_id" {
  value = "${aws_instance.alpha.id}"
}
output "ec2_instance_type_t2_small_id" {
  value = "${aws_instance.beta.id}"
}

#---------------------- image_id property --------------------------#

# Debian
data "aws_ami" "debian" {
  most_recent       = true
  owners            = ["679593333241"]

  filter {
    name   = "name"
    values = ["debian-jessie-amd64-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name  = "root-device-type"
    values = ["ebs"]
  }
}
output "ec2_ami_id_debian" {
  value = "${data.aws_ami.debian.id}"
}
output "ec2_instance_debian_id" {
  value = "${aws_instance.alpha.id}"
}

# Centos
data "aws_ami" "centos" {
  most_recent       = true
  owners            = ["679593333241"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name  = "root-device-type"
    values = ["ebs"]
  }
}
output "ec2_ami_id_centos" {
  value = "${data.aws_ami.centos.id}"
}
output "ec2_instance_centos_id" {
  value = "${aws_instance.beta.id}"
}

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

resource "aws_vpc" "non_default" {
  cidr_block = "172.32.0.0/16"
}

output "vpc_non_default_id" {
  value = "${aws_vpc.non_default.id}"
}

output "vpc_non_default_cidr_block" {
  value = "${aws_vpc.non_default.cidr_block}"
}

output "vpc_non_default_instance_tenancy" {
  value = "${aws_vpc.non_default.instance_tenancy}"
}

# Create a security group with a known description
# in the default VPC
resource "aws_security_group" "alpha" {
  name        = "${terraform.env}-alpha"
  description = "SG alpha"
  vpc_id      = "${data.aws_vpc.default.id}"
}

output "ec2_security_group_alpha_group_id" {
  value = "${aws_security_group.alpha.id}"
}

output "ec2_security_group_alpha_group_name" {
  value = "${aws_security_group.alpha.name}"
}

#============================================================#
#                      VPC Subnets
#============================================================#
resource "aws_subnet" "subnet_01" {
  vpc_id     = "${data.aws_vpc.default.id}"
  cidr_block = "172.31.96.0/20"
}

# Re-output any VPC ID for subnet listings
output "subnet_vpc_id" {
  # Use the default VPC since it is gaurenteed
  value = "${data.aws_vpc.default.id}"
}

output "subnet_01_id" {
  value = "${aws_subnet.subnet_01.id}"
}

output "subnet_01_az" {
  value = "${aws_subnet.subnet_01.availability_zone}"
}
