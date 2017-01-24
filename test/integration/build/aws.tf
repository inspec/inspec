provider "aws" {}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"

  tags {
    Name = "Example"
    X-Project = "inspec"
  }
}
