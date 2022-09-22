output "EC2_public_IP" {
  value = aws_instance.Demo-instance.public_ip
}
output "EC2_private_IP" {
  value = aws_instance.Demo-instance.private_ip
}
output "instance_id" {
  value = aws_instance.Demo-instance.id
}
output "aws_vpc_id" {
  value = aws_vpc.demo-vpc.id
}
