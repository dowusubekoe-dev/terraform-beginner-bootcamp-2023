terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "dowusubekoe-dev"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

cloud {
    organization = "dowusubekoe-dev"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length  = 32
  special = false
}

resource "aws_s3_bucket" "example" {
  # Bucket Naming Rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}