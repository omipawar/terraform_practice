# secret key creation
resource "aws_key_pair" "deployer" {
  key_name   = "my_key"
  public_key = file("ssh_public_id")
}

# default vpc
#resource aws_default_vpc default{

#}

# data block to get default vpc
data "aws_vpc" "default" {
  default = true
}


# Security group
resource "aws_security_group" "tf_sg" {
  name        = "tf-instance-sg"
  description = "allow SSH to instance"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instance-sg"
  }
}

# EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami_id"
  instance_type = "t3.small"
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.tf_sg.id]

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "my-tf-instance"
  }
}
