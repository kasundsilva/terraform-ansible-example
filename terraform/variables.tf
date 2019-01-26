variable "access_key" {}

variable "secret_key" {}

variable "aws_key_path" {}

variable "aws_key_name" {}

variable "region" {
  default = "us-east-2"
}

variable "public_subnets" {
  description = "A list of subnets in CIDR notation for public use"
  type        = "list"
  default     = []
}
