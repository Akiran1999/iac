variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "aws_vpc" {
  type        = string
  default     = "10.10.0.0/16"
  description = "cidr block for demo vpc"
}

variable "public_subnet_cidr" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24"]
  description = "cidr block for public subnets"
}

variable "private_subnet_cidr" {
  type        = list(string)
  default     = ["10.10.2.0/24", "10.10.3.0/24"]
  description = "cidr block for private subnets"
}

variable "availability_zone" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "this is for both subnets availability zone"
}
