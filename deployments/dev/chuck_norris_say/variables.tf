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

