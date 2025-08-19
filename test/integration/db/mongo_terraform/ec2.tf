# TODO: Find better way to generate private key
# https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh

  tags = {
    Name = var.key_name
  }
}

# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "rsa_key_file" {
  content         = tls_private_key.private_key.private_key_pem
  filename        = "${path.module}/${var.key_name}.pem"
  file_permission = "0400"
}

resource "aws_instance" "mongodb" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key_pair.id
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.public-subnet-1.id}"
  security_groups             = ["${aws_security_group.inspec-mongodb-security-group.id}"]
  user_data                   = "${file("provisioning.sh")}"
  tags = {
    Name = var.project_name
    X-LongRunning = "true"
  }

   provisioner "file" {
    source      = "mongod.conf"
    destination = "/tmp/mongod.conf"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/${var.key_name}.pem")
      host        = "${self.public_dns}"
    }
  }
}

resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true
  tags      = {
    Name    = var.project_name
  }
}

resource "aws_route_table" "public-route-table" {
vpc_id       = aws_vpc.vpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.internet-gateway.id
}
  tags       = {
    Name     = var.project_name
  }
}

# Associate Public Subnet 1 to "Public Route Table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id
  tags = {
    Name    = var.project_name
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.Public_Subnet_1}"
  availability_zone       = "${var.availability_zone}"
  map_public_ip_on_launch = true
  tags      = {
    Name    = var.project_name
  }
}

resource "aws_security_group" "inspec-mongodb-security-group" {
  name        = "${var.project_name}-ssh-sg"
  description = "Enable ssh and mongodb access ports"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh-location}"]
  }

  ingress {
    description      = "Mongodb port"
    from_port        = 27017
    to_port          = 27017
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = var.project_name
  }
}

