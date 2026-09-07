output "ec2_public_dns" {
  value = aws_instance.instance.public_dns
}

output "ec2_security_group_id" {
  value = aws_security_group.instance.id
}

output "mysql_db_instance_address" {
  value = aws_db_instance.db_instance.address
}

output "latest_amazon_linux_ami_id" {
  value = data.aws_ami.latest_amazon_linux.id
}

output "ec2_subnet_id" {
  value = module.vpc.public_subnets[0]
}

output "mysql_db_name" {
  value = aws_db_instance.db_instance.name
}

output "mysql_db_port" {
  value = aws_db_instance.db_instance.port
}

output "mysql_db_username" {
  value = aws_db_instance.db_instance.username
}

output "mysql_db_password" {
  value = aws_db_instance.db_instance.password
  sensitive = true
}
