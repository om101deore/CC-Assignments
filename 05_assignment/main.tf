terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

