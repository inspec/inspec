resource "aws_flow_log" "flow_log_alpha_vpc_log" {
  log_group_name = "${aws_cloudwatch_log_group.flow_log_alpha_log_group.name}"
  iam_role_arn   = "${aws_iam_role.flow_log_alpha_role.arn}"
  vpc_id         = "${data.aws_vpc.default.id}"
  traffic_type   = "ALL"
}

resource "aws_subnet" "flow_log_alpha_subnet" {
  vpc_id     = "${data.aws_vpc.default.id}"
  cidr_block = "172.31.112.0/24"
}

resource "aws_flow_log" "flow_log_alpha_subnet_log" {
  log_group_name = "${aws_cloudwatch_log_group.flow_log_alpha_log_group.name}"
  iam_role_arn   = "${aws_iam_role.flow_log_alpha_role.arn}"
  subnet_id      = "${aws_subnet.flow_log_alpha_subnet.id}"
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "flow_log_alpha_log_group" {
  name = "flow_log_alpha_log_group"
}

resource "aws_iam_role" "flow_log_alpha_role" {
  name = "flow_log_alpha_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "flow_log_alpha_policy" {
  name = "flow_log_alpha_policy"
  role = "${aws_iam_role.flow_log_alpha_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "flow_log_alpha_vpc_log_id" {
  value = "${aws_flow_log.flow_log_alpha_vpc_log.id}"
}

output "flow_log_alpha_subnet_log_id" {
  value = "${aws_flow_log.flow_log_alpha_subnet_log.id}"
}

output "flow_log_alpha_subnet_id" {
  value = "${aws_subnet.flow_log_alpha_subnet.id}"
}

output "flow_log_vpc_id" {
  value = "${data.aws_vpc.default.id}"
}
