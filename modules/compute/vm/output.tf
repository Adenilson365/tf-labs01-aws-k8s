output "ec2-ip" {
  value = aws_instance.ec2.public_ip

}