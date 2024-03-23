variable "vpc_cidr_block" {
  description = "CIDR range to set for VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR range to set for public subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "CIDR range to set for private subnet"
  type        = string
  default     = "10.1.2.0/24"
}

variable "environment" {
  description = "Project name to prefix all resource names"
  type        = string
  default     = "dummy"
}


variable "aws_region" {
  description = "AWS region to deploy to"
  type = string
  default = "ap-southeast-2"
}