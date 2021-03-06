module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"
  # insert the 21 required variables here
  name = "my-vpc"
  cidr = "10.0.0.0/24"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.0.0/26", "10.0.0.64/26"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
