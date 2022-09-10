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

#below code creates AWS EC2 instance

resource "aws_instance" "Linux_server" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  key_name = "myawsdemokey"
  
  tags = {
    Name = "demo-Instance"
  }
}



# below code creates AWS S3 bucket
resource "aws_s3_bucket" "testbucket10092022" {
  bucket = "my-tf-test-bucket-100622"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
