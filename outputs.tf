output "EC2_public_IP" {
  value = aws_instance.Demo-instance.public_ip
}