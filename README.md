
## Simple Terraform/Ansible provissioning script to create an aws ec2 instance and run an Nginx docker container inside.    

## Details

This repository sets up:

* A VPC
* public and private subnets
* An internet gateway
* Security groups
* A publicly-accessible EC2 instance with Ubuntu 18.04
* Within the EC2 instance:
   * Nginx docker container


### Install the following locally:
    * [Terraform](https://www.terraform.io/) >= 0.10.0
    * [Terraform Inventory](https://github.com/adammck/terraform-inventory)

    * Ensure you add the key pair from aws to `terraform/keys` folder.


## Structure
```
.
├── ansible
│   ├── playbook.yml
│   └── scripts
│       ├── nginx-fetch-output.sh
│       └── nginx-healthcheck.sh
├── deploy.sh
├── README.md
└── terraform
    ├── instances
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── keys
    │   └── qrious.pem
    ├── main.tf
    ├── network
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── sg_groups.tf
    │   └── variables.tf
    ├── outputs.tf
    └── variables.tf
```
 
## Notes
You can add `terraform/terraform.tfvars` which contais runtime variables. If you don't have this file in place terraform will prompt 
for these values in the runtime.
```
access_key = "<access_key>"
secret_key = "<secret_key>"
aws_reagion = "us-east-2"
aws_key_path = "<path_to_key>"
aws_key_name = "<key_name>"
```

## Usage

```sh
./deploy.sh
```

## Cleanup

```sh
cd terraform
terraform destroy
```
