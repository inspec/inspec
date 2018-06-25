#===========================================================================#
#                                 Route Tables
#===========================================================================#

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = ["${data.aws_vpc.default.id}"]
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = "${data.aws_vpc.default.id}"

  route {
    cidr_block = "172.32.1.0/24"
    gateway_id = "${data.aws_internet_gateway.default.id}"
  }
}

resource "aws_route_table" "rtb2" {
  vpc_id = "${data.aws_vpc.default.id}"

  route {
    cidr_block = "172.32.1.0/24"
    gateway_id = "${data.aws_internet_gateway.default.id}"
  }
}

output "route_table_1_id" {
  value = "${aws_route_table.rtb.id}"
}

output "route_table_2_id" {
  value = "${aws_route_table.rtb2.id}"
}

output "route_table_1_propagating_vgws" {
  value = "${aws_route_table.rtb.propagating_vgws}"
}

output "route_table_1_vpc_id" {
  value = "${aws_route_table.rtb.vpc_id}"
}
