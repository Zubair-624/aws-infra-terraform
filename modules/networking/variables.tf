variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environemtn name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

