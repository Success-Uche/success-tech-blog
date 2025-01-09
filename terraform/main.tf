# Terraform Provider Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
  }

  # Remote Backend Configuration
  backend "remote" {
    organization = "success-cloud"

    workspaces {
      name = "cloud-talents"
    }
  }
}