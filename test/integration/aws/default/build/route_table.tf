#===========================================================================#
#                                 Route Tables
#===========================================================================#


data "aws_internet_gateway" "default" {
  filter {
    name = "attachment.vpc-id"
    values = ["${data.aws_vpc.default.id}"]
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = "${data.aws_vpc.default.id}"

  route {
    cidr_block = "172.32.1.0/24"
    gateway_id = "${data.aws_internet_gateway.default.id}"
  }

  tags {
    Name = "InSpec"
  }
}

output "routetable_rtb_route_table_id" {
  value = "${aws_route_table.rtb.id}"
}

output "routetable_rtb_associations" {
  value = "${aws_route_table.rtb.associations}"
}

output "routetable_rtb_propagating_vgws" {
  value = "${aws_route_table.rtb.propagating_vgws}"
}

output "routetable_rtb_routes" {
  value = "${aws_route_table.rtb.routes}"
}

output "routetable_rtb_tags" {
  value = "${aws_route_table.rtb.tags}"
}

output "routetable_rtb_vpc_id" {
  value = "${aws_route_table.rtb.vpc_id}"
}
