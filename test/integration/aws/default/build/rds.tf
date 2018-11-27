# Contains resources and outputs related to testing the aws_rds_* resources.

#======================================================#
#                    RDS Instances
#======================================================#


resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.6.37"
  instance_class       = "db.t2.micro"
  identifier           = "test-instance-id"
  name                 = "test_instance"
  username             = "testuser"
  password             = "testpassword"
  parameter_group_name = "default.mysql5.6"
  skip_final_snapshot  = true
  depends_on  = [ "aws_subnet.subnet_01" ]
}

output "rds_db_instance_id" {
  description = "The RDS instance ID"
  value       = "${aws_db_instance.default.id}"
}
