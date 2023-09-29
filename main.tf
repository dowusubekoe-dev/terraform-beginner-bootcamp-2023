terraform {

cloud {
    organization = "dowusubekoe-dev"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 32
  special          = false
}

output "random_bucket_name_name" {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }

# provider "random" {
#   # Configuration options
# }

provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length  = 32
  special = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
# Bucket Naming Rules
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {

  value = random_string.bucket_name.result
}