resource "aws_security_group" "tf-instance-sg" {
  name = "${var.env}-Allow http and ssh traffic"
  description = "${var.env}-Allow only http and ssh traffic to the tf instance"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
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
    Name = "${var.env}-security-group"
    Environment = "${var.env}"
  }
}

resource "aws_instance" "tf-instance" {
  count = var.ec2_count
  ami = var.ami_id
  key_name = var.key_pair
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.tf-instance-sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "${var.env}-instance"
    Environment = "${var.env}"
  }
}
