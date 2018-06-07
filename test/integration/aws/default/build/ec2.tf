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
    Name      = "${terraform.env}.alpha"
    X-Project = "inspec"
  }
}

resource "aws_instance" "beta" {
  ami                  = "${data.aws_ami.centos.id}"
  instance_type        = "t2.small"
  iam_instance_profile = "${aws_iam_instance_profile.profile_for_ec2_with_role.name}"

  tags {
    Name      = "${terraform.env}.beta"
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
  name = "${terraform.env}.profile_for_ec2_with_role"
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
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["debian-jessie-amd64-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
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
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
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
  name   = "default"
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

output "vpc_default_vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "vpc_default_cidr_block" {
  value = "${data.aws_vpc.default.cidr_block}"
}

output "vpc_default_dhcp_options_id" {
  value = "${data.aws_vpc.default.dhcp_options_id}"
}

output "vpc_non_default_vpc_id" {
  value = "${aws_vpc.non_default.id}"
}

output "vpc_non_default_cidr_block" {
  value = "${aws_vpc.non_default.cidr_block}"
}

output "vpc_non_default_instance_tenancy" {
  value = "${aws_vpc.non_default.instance_tenancy}"
}

output "vpc_non_default_dhcp_options_id" {
  value = "${aws_vpc.non_default.dhcp_options_id}"
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

# NOTE: AWS (in the console and CLI) creates SGs with a default
# allow all egress.  Terraform removes that rule, unless you specify it here.

# Populate SG Alpha with some rules
resource "aws_security_group_rule" "alpha_http_world" {
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.alpha.id}"
}

resource "aws_security_group_rule" "alpha_ssh_in" {
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  cidr_blocks       = ["10.1.2.0/24"]
  security_group_id = "${aws_security_group.alpha.id}"
}

resource "aws_security_group_rule" "alpha_x11" {
  description       = "Only allow X11 out for some reason"
  type              = "egress"
  from_port         = "6000"
  to_port           = "6007"
  protocol          = "tcp"
  cidr_blocks       = ["10.1.2.0/24", "10.3.2.0/24"]
  security_group_id = "${aws_security_group.alpha.id}"
}

resource "aws_security_group_rule" "alpha_all_ports" {
  type              = "ingress"
  from_port         = "0"
  to_port           = "65535"
  protocol          = "tcp"
  cidr_blocks       = ["10.1.2.0/24"]
  security_group_id = "${aws_security_group.alpha.id}"
}

#============================================================#
#                      VPC Subnets
#============================================================#

variable "base_cidr" {
  default = "172.31.48.0/20"
}

resource "aws_subnet" "subnet_01" {
  vpc_id     = "${data.aws_vpc.default.id}"
  cidr_block = "${cidrsubnet(var.base_cidr, 8, 0)}"

  tags {
    Name = "${terraform.env}.subnet_01"
  }
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

#============================================================#
#                      ELB testing
#============================================================#

# Use default VPC - "${data.aws_vpc.default.id}"

# Use two subnets.
# Fixture data:

# ELB alpha
#  - single subnet on AZ a
#  - not externally facing
#  - sends 80 to 8080
#  - zero instances
# ELB beta
#  - dual subnet on AZ a and c
#  - externally facing
#  - sends 80 to 80
#  - two instances

# A pair of subnets
resource "aws_subnet" "elb_a" {
  vpc_id            = "${data.aws_vpc.default.id}"
  availability_zone = "${data.aws_region.current.name}a"
  cidr_block        = "${cidrsubnet(var.base_cidr, 8, 1)}"

  tags {
    Name = "${terraform.env}.elb_a"
  }
}

output "elb_subnet_a_id" {
  value = "${aws_subnet.elb_a.id}"
}

output "elb_vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

resource "aws_subnet" "elb_c" {
  vpc_id            = "${data.aws_vpc.default.id}"
  availability_zone = "${data.aws_region.current.name}c"
  cidr_block        = "${cidrsubnet(var.base_cidr, 8, 2)}"

  tags {
    Name = "${terraform.env}.elb_c"
  }
}

output "elb_subnet_c_id" {
  value = "${aws_subnet.elb_c.id}"
}

# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "elb_world_to_lb" {
  vpc_id = "${data.aws_vpc.default.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "elb_security_group_to_lb_id" {
  value = "${aws_security_group.elb_world_to_lb.id}"
}

resource "aws_security_group" "elb_lb_to_instances" {
  vpc_id = "${data.aws_vpc.default.id}"

  # HTTP access from the VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.default.cidr_block}"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.default.cidr_block}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "elb_security_group_to_instances_id" {
  value = "${aws_security_group.elb_lb_to_instances.id}"
}

resource "aws_elb" "alpha" {
  name = "${terraform.env}-alpha"

  subnets = [
    "${aws_subnet.elb_a.id}",
  ]

  security_groups = [
    "${aws_security_group.elb_world_to_lb.id}",
  ]

  instances = []

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

output "elb_alpha_name" {
  value = "${aws_elb.alpha.name}"
}

output "elb_alpha_dns_name" {
  value = "${aws_elb.alpha.dns_name}"
}

resource "aws_elb" "beta" {
  name = "${terraform.env}-beta"

  subnets = [
    "${aws_subnet.elb_a.id}",
    "${aws_subnet.elb_c.id}",
  ]

  security_groups = [
    "${aws_security_group.elb_world_to_lb.id}",
  ]

  instances = [
    "${aws_instance.elb_beta_1.id}",
    "${aws_instance.elb_beta_2.id}",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

output "elb_beta_name" {
  value = "${aws_elb.beta.name}"
}

output "elb_beta_dns_name" {
  value = "${aws_elb.beta.dns_name}"
}

resource "aws_instance" "elb_beta_1" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.debian.id}"
  subnet_id     = "${aws_subnet.elb_c.id}"

  vpc_security_group_ids = [
    "${aws_security_group.elb_lb_to_instances.id}",
  ]

  tags {
    Name = "${terraform.env}.elb_beta_1"
  }
}

output "elb_beta_instance_1_id" {
  value = "${aws_instance.elb_beta_1.id}"
}

resource "aws_instance" "elb_beta_2" {
  instance_type = "t2.micro"
  ami           = "${data.aws_ami.debian.id}"
  subnet_id     = "${aws_subnet.elb_a.id}"

  vpc_security_group_ids = [
    "${aws_security_group.elb_lb_to_instances.id}",
  ]

  tags {
    Name = "${terraform.env}.elb_beta_2"
  }
}

output "elb_beta_instance_2_id" {
  value = "${aws_instance.elb_beta_2.id}"
}
