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
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "pub_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.demo-vpc.id
  availability_zone       = element(var.availability_zone, count.index)
  cidr_block              = element(var.public_subnet_cidr, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnet" {
  count                   = length(var.private_subnet_cidr)
  vpc_id                  = aws_vpc.demo-vpc.id
  availability_zone       = element(var.availability_zone, count.index)
  cidr_block              = element(var.private_subnet_cidr, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

