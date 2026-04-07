module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env}-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "${var.env}"
  }
}

module "dev-infra" {
  source        = "./infra"
  env           = "dev"
  ec2_count     = 1
  ami_id        = "ami-05d2d839d4f73aafb"
  key_pair      = "devops"
  instance_type = "t3.micro"

  vpc_id = module.vpc.vpc_id
}
