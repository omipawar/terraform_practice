variable "ami_id" {
  type    = string
  default = "ami-05d2d839d4f73aafb"
}

variable "key_pair" {
  type    = string
  default = "devops"
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "env" {
  type    = string
  default = "dev"
}
