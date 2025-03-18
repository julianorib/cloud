terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

## Obter as AZ disponiveis
data "aws_availability_zones" "available" {}

## Obter a VPC Default 
data "aws_vpc" "default" {}

## Obter as Subnets Default
data "aws_subnets" "default" {}

## Obter a AMI Amazon Linux mais recente
data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

## Criar um Security Group de acesso Internet
resource "aws_security_group" "acesso-out-internet" {
  name        = "acesso-out-internet"
  description = "permite acesso out internet"
  vpc_id      = data.aws_vpc.default.id

  egress {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar um Security Group de acesso SSH
resource "aws_security_group" "acesso-in-ssh" {
  name        = "acesso-in-ssh"
  description = "permite acesso in ssh"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar um Security Group de acesso WEB
resource "aws_security_group" "acesso-in-web" {
  name        = "acesso-in-http"
  description = "permite acesso in web"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar uma Key Pair
resource "aws_key_pair" "example" {
  key_name   = "example"
  public_key = file("/home/julianorib/.ssh/id_rsa.pub")
}

resource "aws_launch_template" "example" {
  name_prefix            = "example"
  image_id               = data.aws_ami.amzn-linux-2023-ami.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.acesso-out-internet.id, aws_security_group.acesso-in-ssh.id, aws_security_group.acesso-in-web.id]
  key_name = aws_key_pair.example.key_name
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "example"
    }
  }
   user_data = filebase64("${path.module}/example.sh")
}

resource "aws_autoscaling_group" "example" {
  name_prefix         = "example"
  vpc_zone_identifier = data.aws_subnets.default.ids


  desired_capacity = 3
  max_size         = 5
  min_size         = 2

  launch_template {
    id      = aws_launch_template.example.id
    version = aws_launch_template.example.latest_version
  }
  tag {
    key                 = "Name"
    value               = "example"
    propagate_at_launch = true
  }
}


