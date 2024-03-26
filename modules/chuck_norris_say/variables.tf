variable "environment" {
  description = "Project name to prefix all resource names"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type = string
  default = "ap-southeast-2"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id_1" {
  type = string
}

variable "public_subnet_id_2" {
  type = string
}

variable "private_subnet_id_1" {
  type = string
}

variable "private_subnet_id_2" {
  type = string
}

variable "chuck_norris_bucket_arn" {
  type = string
}

variable "chuck_norris_ecr_url" {
  type = string
}

variable "ecr_image_tag" {
  type = string
}