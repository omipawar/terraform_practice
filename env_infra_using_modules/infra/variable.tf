variable "env" {
    type = string
    description = "This is value of my infra environment"  
    # default = "dev"
}

variable "vpc_id" {
  type = string
  description = "This is created vpc id for ec2 and sg"
}

variable "ec2_count" {
  type = number
  description = "This is count to create number of ec2 instances"
}

variable ami_id {
    type = string
    description = "ami id for ec2 instance"
    # default = "ami-05d2d839d4f73aafb"
}

variable key_pair {
    type = string
    description = "Name of key pair to use"
    # default =  "devops"
}

variable instance_type{
    type = string
    # default = "t3.small"
}   
