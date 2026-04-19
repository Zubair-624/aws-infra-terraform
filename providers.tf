provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "aws-infra-terraform"
      Environment = var.environment
      Owner       = "zubair-devops"
      ManagedBy   = "Terraform"
    }
  }
}