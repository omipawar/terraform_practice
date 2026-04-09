locals {
  name            = "tf-resources"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["ap-south-1a"]
  public_subnets  = ["10.0.0.0/24"]
  private_subnets = ["10.0.1.0/24"]
  intra_subnets   = ["10.0.2.0/24"]
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
  region = "ap-south-1"
}
