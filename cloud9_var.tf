variable "region" {
  type = string
  default = "us-east-1"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "image_id" {
  type = string
  default = "amazonlinux-2-x86_64"
}
variable "owner_arn" {
  type = string
  default  = "arn:aws:iam::aws:policy/AdministratorAccess"
}