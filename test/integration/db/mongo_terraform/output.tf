output "ec2_public_dns" {
  value = aws_instance.mongodb.public_dns
}

output "mongodb_host_ip" {
  value = aws_instance.mongodb.public_ip
}