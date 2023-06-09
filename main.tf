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
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-04e601abe3e1a910f"
  instance_type = "m5.large"
  security_groups = [aws_security_group.terraform_ec2_security.name]
  key_name = "terr06ppk"

  tags = {
    Name = "terraform-example"
    Department = "LMD"
  }
}

resource "aws_default_vpc" "main" {
  tags = {
    Name = "Main"
  }
}

#output "public_ip" {
#  value = aws_instance.example.public_ip
#}
