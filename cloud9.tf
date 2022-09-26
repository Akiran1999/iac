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
  region = var.region
}

resource "aws_cloud9_environment_ec2" "Demo" {
  name = "Demo-1"
  instance_type = var.instance_type
  description = "This is my Demo cloud9 environment"
  image_id = var.image_id
  owner_arn = var.owner_arn
  
}

data "aws_instance" "cloud9_instance" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [
    aws_cloud9_environment_ec2.Demo.id]
  }
}

output "cloud9_url" {
  value = "https://${var.region}.console.aws.amazon.com/cloud9/ide/${aws_cloud9_environment_ec2.Demo.id}"
}