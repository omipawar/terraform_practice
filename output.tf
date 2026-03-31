output "instance_ip" {
  value = aws_instance.tf-instance.public_ip
}