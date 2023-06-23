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
  region        = "us-east-1"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-test-bucket"
  region = "us-east-1"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

}