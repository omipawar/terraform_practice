output "instance_ip" {
  value = {
    for k, v in aws_instance.tf-instance : k=> v.public_ip
  }
#   value = aws_instance.tf-instance[*].public_ip
}