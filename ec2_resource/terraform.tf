terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }
  }
  
  backend "s3"{
    bucket = "<bucket name>"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "<dynamo db table name>"
  }

}
