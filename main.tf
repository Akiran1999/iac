terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "demo-vpc" {
  cidr_block           = var.aws_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    name = "demo-vpc"
  }
}

resource "aws_subnet" "pub_subnet1" {

  vpc_id                  = aws_vpc.demo-vpc.id
  availability_zone       = var.availability_zone
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet1"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id                  = aws_vpc.demo-vpc.id
  availability_zone       = var.availability_zone
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_instance" "Demo-instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.pub_subnet1.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.demo-sg-1.id]

  tags = {
    Name = "Demo-instance"

  }

}
