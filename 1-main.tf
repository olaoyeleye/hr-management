terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=1"
    }
  }
  backend "s3" {
    region = "eu-west-1"
    bucket = var.bucket
    key    = var.key
  }
}