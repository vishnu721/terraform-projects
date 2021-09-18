data "terraform_remote_state" "vpc_info" {
  backend = "s3"

  config = {
    bucket = "vishnu-terraform-state-bucket"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "JenkinsServer"
  instance_count = 1

  ami                    = "ami-0f8f3e38c86610f2c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${data.terraform_remote_state.vpc_info.outputs.default_security_group_id}"]
  subnet_id              = "${data.terraform_remote_state.vpc_info.outputs.public_subnet_ids[0]}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}