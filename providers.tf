provider "aws" {
  region = var.aws_region
  profile = "zubair-devops"

  default_tags {
    tags = {
        Project = "aws-infra-terraform"
        Environment = var.environment
        Owner = "zubair"
        Managedby = "Terraform"
    }
  }
}