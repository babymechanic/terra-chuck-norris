terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "terraform-tut"
    key = "state/first_exercise/dev/common_infra"
    region = "ap-southeast-2"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

module "common_infra" {
  source = "../../../modules/common"
  aws_region = var.aws_region
  vpc_cidr_block = "10.1.0.0/16"
  public_subnet_cidr_block = "10.1.1.0/24"
  private_subnet_cidr_block = "10.1.2.0/24"
  environment = "dev"
}