variable "bucket" {
    type = string
}

variable "region" {
    type =  string
  
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}