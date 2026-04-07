variable "env" {
  type        = string
  description = "This is value of my infra environment"
  # default = "dev"
}

variable "azs" {
  type        = list(string)
  description = "This is values of azs"
  # default = ["ap-south-1a", "ap-south-1b", "ap-south-1c" ]
}

variable "private_subnets" {
  type        = list(string)
  description = "This is values of private subnet"
  # default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "This is values of public subnet"
  # default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
