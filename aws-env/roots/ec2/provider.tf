terraform {
    backend "s3" {
    bucket = "vishnu-terraform-state-bucket"
    key = "ec2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "vishnu-terraform-state-table"
  }
}

provider "aws" {
  region = "us-east-1"
}