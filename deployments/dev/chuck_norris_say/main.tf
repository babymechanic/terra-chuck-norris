terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket = "terraform-tut"
    key    = "state/first_exercise/dev/chuck_norris"
    region = "ap-southeast-2"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

data "terraform_remote_state" "common_infra" {
  backend = "s3"
  config  = {
    bucket = "terraform-tut"
    key    = format("state/first_exercise/%s/common_infra", var.environment)
    region = var.aws_region
  }
}

module "chuck_norris_say" {
  source                  = "../../../modules/chuck_norris_say"
  public_subnet_id_1      = data.terraform_remote_state.common_infra.outputs.public_subnet_id_1
  public_subnet_id_2      = data.terraform_remote_state.common_infra.outputs.public_subnet_id_2
  vpc_id                  = data.terraform_remote_state.common_infra.outputs.vpc_id
  private_subnet_id_1     = data.terraform_remote_state.common_infra.outputs.private_subnet_id_1
  private_subnet_id_2     = data.terraform_remote_state.common_infra.outputs.private_subnet_id_2
  chuck_norris_bucket_arn = data.terraform_remote_state.common_infra.outputs.chuck_norris_bucket_arn
  chuck_norris_ecr_url    = data.terraform_remote_state.common_infra.outputs.chuck_norris_ecr_repo_url
}