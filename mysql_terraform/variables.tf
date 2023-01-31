# all variable are defined externally using `export TF_VAR_project_name=...` in the make.sh file
variable "project_name" {
  default = "inspec-mysql-db-test"
}
variable "key_name" {
  default = "inspec-db-test"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "aws_profile" {
  default = "chef-engineering"
}

variable "mysql_identifier" {
  default = "inspec-test-rds-mysql"
}

variable "mysql_username" {
  default = "admin"
}

variable "mysql_password" {
  default = "adminpasswd"
}
