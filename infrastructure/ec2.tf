provider "aws" {
  region  = "us-east-2"
  profile = "device"
}

data "aws_ami" "kali" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Kali Linux 20*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["679593333241"]
}

resource "aws_key_pair" "ec2_public_key" {
	key_name   = "ssh-public-key"
    public_key = var.ssh_public_key
}

resource "aws_instance" "kali" {
  ami           = data.aws_ami.kali.id
  instance_type = "t2.micro"

  key_name = aws_key_pair.ec2_public_key.key_name

  tags = {
    Name = "Kowli Lincox"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id

  ingress {
  	from_port   = 22
  	to_port     = 22
  	protocol    = "tcp"
  	cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_id" {
	value = aws_instance.kali.id
}

output "instance_az" {
	value = aws_instance.kali.availability_zone
}

output "public_ip" {
	value = aws_instance.kali.public_ip
}

output "public_dns" {
	value = aws_instance.kali.public_dns
}

output "connection_cmd" {
    value = "ssh -i ec2-key ec2-user@${aws_instance.kali.public_dns}"
}