data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "tf-sg" {
  name = "allow_ssh_and_http"
  description = "Allow all http and ssh connections"
  vpc_id = data.aws_vpc.default.id

  ingress{
    to_port = 22
    from_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    to_port = 80
    from_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    to_port = 0
    from_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http-ssh"
  }
}

resource "aws_instance" "tf-instance" {
  ami = var.ami_id
  key_name = var.key_pair
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  user_data = file("nginx.sh")

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "nginx-server"
  }
}