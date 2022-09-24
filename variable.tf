#variable file
variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "AWS Region"
}

variable "aws_vpc" {
  type = string
  default = "10.10.0.0/16"
  description = "cidr block for demo vpc"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.10.0.0/24"
  description = "cidr block for public subnet"
}

variable "private_subnet_cidr" {
  type = string
  default = "10.10.1.0/24"
  description = "cidr block for private subnet"
}

variable "ami" {
  type = string
  default = "ami-052efd3df9dad4825"
  description = "AMI id for ubuntu server 22.04"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "size of VM"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
  description = "this is for both subnets availability zone"
}

variable "key_name" {
  type = string
  default = "myawsdemokey"
  description = "This is the key of my instance"
}