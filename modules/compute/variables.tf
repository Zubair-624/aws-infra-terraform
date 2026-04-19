variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environemnt name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "my_ip" {
  description = "My public IP for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet id from networking module"
  type        = string
}

variable "vpc_id" {
  description = "VPC id from networking module"
  type        = string
}