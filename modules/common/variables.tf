variable "vpc_cidr_block" {
  description = "CIDR range to set for VPC"
  type        = string
}

variable "public_subnet_cidr_block_1" {
  description = "CIDR range to set for public subnet"
  type        = string
}

variable "public_subnet_cidr_block_2" {
  description = "CIDR range to set for public subnet"
  type        = string
}

variable "private_subnet_cidr_block_1" {
  description = "CIDR range to set for private subnet"
  type        = string
}

variable "private_subnet_cidr_block_2" {
  description = "CIDR range to set for private subnet"
  type        = string
}

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

variable "aws_public_subnet_region_1" {
  description = "AWS region for subnets"
  type = string
  default = "ap-southeast-2a"
}

variable "aws_public_subnet_region_2" {
  description = "AWS region for subnets"
  type = string
  default = "ap-southeast-2b"
}

variable "aws_private_subnet_region_1" {
  description = "AWS region for subnets"
  type = string
  default = "ap-southeast-2a"
}

variable "aws_private_subnet_region_2" {
  description = "AWS region for subnets"
  type = string
  default = "ap-southeast-2b"
}