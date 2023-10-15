terraform {
  # cloud {
  #   organization = "dorbsyfx_dev"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
provider "random" {
  # Configuration options
}