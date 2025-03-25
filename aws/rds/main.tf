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

## Obter a VPC Default 
data "aws_vpc" "default" {}

## Obter as Subnets Default
data "aws_subnets" "default" {}

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

## Criar um Security Group para Acesso Externo
resource "aws_security_group" "acesso-in-mysql" {
  name        = "acesso-in-mysql"
  description = "permite acesso in mysql"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "MYSQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## Criar uma Instância DB com Engine Mysql
resource "aws_db_instance" "mydb" {
  allocated_storage    = 20
  identifier              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t4g.micro"
  username             = "admin"
  password             = "j9aei13Cc51aB"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.acesso-in-mysql.id]
  publicly_accessible = true
    
    tags = {
    Name = "MySQL RDS Instance"
  }
}

output "endpoint" {
  value = aws_db_instance.mydb.endpoint
}