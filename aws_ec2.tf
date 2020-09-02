provider "aws" {
        access_key = "XXXXXXXXXX"
        secret_key = "XXXXXXXXXX"
        region     = "ap-south-1"
}

resource "aws_instance" "webserver" {
        ami = "ami-0ebc1ac48dfd14136"
        instance_type ="t2.micro"
                key_name = "${aws_key_pair.ssh_key.key_name}"
        security_groups = ["${aws_security_group.allow_ports.name}"]
    tags = {
    name = "WebserverCG"
        }
}
resource "aws_key_pair" "ssh_key" {
        key_name = "ssh_key"
        public_key = "${file("/home/ec2-user/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Allow 22 and 80 inbound traffic"
  vpc_id      = "vpc-ded136b5"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ports"
  }
}
