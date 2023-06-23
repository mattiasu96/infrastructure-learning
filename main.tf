terraform {
  cloud {
    organization = "mattiasu96"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}