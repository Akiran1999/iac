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
  region = "us-east-1"
}

resource "aws_vpc" "demo-vpc" {
    cidr_block = "10.10.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        name = "demo-vpc"
    }  
}

resource "aws_subnet" "pub_subnet1" {

  vpc_id            = aws_vpc.demo-vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "10.10.0.0/24"
  map_public_ip_on_launch = true
  tags = {
     Name = "pub-subnet1"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id = aws_vpc.demo-vpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = false

 tags = {
    Name = "private-subnet1"
 }
}

resource "aws_instance" "Demo-instance" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pub_subnet1.id
    key_name = "myawsdemokey"

    tags = {
        Name = "Demo-instance"

    }
  
}
