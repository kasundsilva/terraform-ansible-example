# Configure the AWS Resource Manager Provider
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# Create a vpc network
module "network" {
  source          = "./network"
  name            = "qrious"
  cidr            = "172.22.0.0/16"
  public_subnets  = ["172.22.253.0/24", "172.22.254.0/24"]
  private_subnets = ["172.22.10.0/24", "172.22.11.0/24"]
  azs_private     = ["us-east-2a", "us-east-2b"]
  azs_public      = ["us-east-2a", "us-east-2b"]
  aws_key_path    = "${var.aws_key_path}"
  aws_key_name    = "${var.aws_key_name}"
}

module "instances" {
  source              = "./instances"
  name                = "qrious"
  aws_key_path        = "${var.aws_key_path}"
  aws_key_name        = "${var.aws_key_name}"
  security_group_ids  = "${module.network.nginx_security_group_id}"
  private_subnets_ids = "${module.network.private_subnets_ids}"
  public_subnets_ids  = "${module.network.public_subnets_ids}"
  nginx_instance_type = "t2.micro"
  ubuntu_ami          = "ami-0f65671a86f061fcd"
}
