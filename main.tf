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
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "mattia-surricchio-bucket-test" # NB: the name has to be unique across all AWS!
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}

resource "aws_ecr_repository" "aws_ecr" {
  name                 = "my_web_app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}